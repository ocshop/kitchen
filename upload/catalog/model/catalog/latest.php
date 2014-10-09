<?php
class ModelCatalogLatest extends Model {

	private $NOW;

	public function __construct($registry) {
		$this->NOW = date('Y-m-d H:i') . ':00';
		parent::__construct($registry);
	}

	public function getLatest($data = array()) {
	
		if ($this->customer->isLogged()) {
			$customer_group_id = $this->customer->getCustomerGroupId();
		} else {
			$customer_group_id = $this->config->get('config_customer_group_id');
		}	
		
		$key = 'product.latest' . md5(serialize($data)) . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id') . '.' . (int)$customer_group_id;
				
		$product_data = $this->cache->get($key);
	
		if (!$product_data) { 
		
			$this->load->model('catalog/product');
		
			$sql = "SELECT * FROM (SELECT p.product_id, p.sort_order, p.model, pd.name, p.quantity, p.price, (SELECT price FROM " . DB_PREFIX . "product_discount pd2 WHERE pd2.product_id = p.product_id AND pd2.customer_group_id = '" . (int)$customer_group_id . "' AND pd2.quantity = '1' AND ((pd2.date_start = '0000-00-00' OR pd2.date_start < '" . $this->NOW . "') AND (pd2.date_end = '0000-00-00' OR pd2.date_end > '" . $this->NOW . "')) ORDER BY pd2.priority ASC, pd2.price ASC LIMIT 1) AS discount, (SELECT price FROM " . DB_PREFIX . "product_special ps WHERE ps.product_id = p.product_id AND ps.customer_group_id = '" . (int)$customer_group_id . "' AND ((ps.date_start = '0000-00-00' OR ps.date_start < '" . $this->NOW . "') AND (ps.date_end = '0000-00-00' OR ps.date_end > '" . $this->NOW . "')) ORDER BY ps.priority ASC, ps.price ASC LIMIT 1) AS special,  (SELECT AVG(rating) AS total FROM " . DB_PREFIX . "review r1 WHERE r1.product_id = p.product_id AND r1.status = '1' GROUP BY r1.product_id) AS rating FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id) LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) WHERE p.status = '1' AND p.date_available <= '" . $this->NOW . "' AND p2s.store_id = '" . (int)$this->config->get('config_store_id') .  "' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY p.date_added DESC";
			
			$sql .= " LIMIT  0," . (int)$data['max'];
			
		$sql .= ") p ORDER BY ";
		
		$sort_data = array(
			'pd.name',
			'quantity',
			'ps.price',
			'rating',
			'p.sort_order',
			'p.model'
		);	
			
		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			if ($data['sort'] == 'pd.name') {
				$sql .= " LCASE('name')";
			} elseif ($data['sort'] == 'ps.price') {
				$sql .= " (CASE WHEN special IS NOT NULL THEN special WHEN discount IS NOT NULL THEN discount ELSE p.price END)";
			} else {
				$sql .= " " . $data['sort'];
			}
		} else {
			$sql .= " sort_order";	
		}
		
		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC, LCASE(name) DESC";
		} else {
			$sql .= " ASC, LCASE(name) ASC";
		}
	
				
		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}				

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}	
		
			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}
			
			$query = $this->db->query($sql);
		 	 
			foreach ($query->rows as $result) {
				$product_data[$result['product_id']] = $this->model_catalog_product->getProduct($result['product_id']);
			}

			$this->cache->set($key, $product_data);
		}
		
				
		return $product_data;
	}
	

}	
?>

