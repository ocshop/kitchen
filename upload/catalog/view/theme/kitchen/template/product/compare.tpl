<?php echo $header; ?>
<div class="<?php if ($column_right) { ?>span9<?php } else {?>span12<?php } ?>">
	<div class="row">
<div class="<?php if ($column_left or $column_right) { ?>span9<?php } ?> <?php if ($column_left and $column_right) { ?>span6<?php } ?> <?php if (!$column_right and !$column_left) { ?>span12 <?php } ?>" id="content"><?php echo $content_top; ?>
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <h1><?php echo $heading_title; ?></h1>
  
  <?php if ($products) { ?>
    <div class="box-container">
  <div class="block-compare">
  <table class="compare-info table table-bordered">
    <thead>
      <tr>
        <td class="last" colspan="<?php echo count($products) + 1; ?>"><?php echo $text_product; ?></td>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><?php echo $text_name; ?></td>
        <?php foreach ($products as $product) { ?>
        <td class="name"><a href="<?php echo $products[$product['product_id']]['href']; ?>"><?php echo $products[$product['product_id']]['name']; ?></a></td>
        <?php } ?>
      </tr>
      <tr>
        <td class="et"><?php echo $text_image; ?></td>
        <?php foreach ($products as $product) { ?>
        <td><?php if ($products[$product['product_id']]['thumb']) { ?>
          <div class="image2"><img id="img_<?php echo $product['product_id']; ?>" src="<?php echo $products[$product['product_id']]['thumb']; ?>" alt="<?php echo $products[$product['product_id']]['name']; ?>" /></div>
          <?php } ?></td>
        <?php } ?>
      </tr>
      <tr>
        <td><?php echo $text_price; ?></td>
        <?php foreach ($products as $product) { ?>
        <td class="td-price"><?php if ($products[$product['product_id']]['price']) { ?>
          <?php if (!$products[$product['product_id']]['special']) { ?>
          <?php echo $products[$product['product_id']]['price']; ?>
          <?php } else { ?>
          <span class="price-old"><?php echo $products[$product['product_id']]['price']; ?></span> <span class="price-new"><?php echo $products[$product['product_id']]['special']; ?></span>
          <?php } ?>
          <?php } ?></td>
        <?php } ?>
      </tr>
      <tr>
        <td class="et"><?php echo $text_model; ?></td>
        <?php foreach ($products as $product) { ?>
        <td><?php echo $products[$product['product_id']]['model']; ?></td>
        <?php } ?>
      </tr>
      <tr>
        <td><?php echo $text_manufacturer; ?></td>
        <?php foreach ($products as $product) { ?>
        <td><?php echo $products[$product['product_id']]['manufacturer']; ?></td>
        <?php } ?>
      </tr>
      <tr>
        <td class="et"><?php echo $text_availability; ?></td>
        <?php foreach ($products as $product) { ?>
        <td><div class="prod-stock"><?php echo $products[$product['product_id']]['availability']; ?></div></td>
        <?php } ?>
      </tr>
        <?php if ($review_status) { ?>
      <tr>
        <td><?php echo $text_rating; ?></td>
        <?php foreach ($products as $product) { ?>
        <td><img src="catalog/view/theme/kitchen/image/stars-<?php echo $products[$product['product_id']]['rating']; ?>.png" alt="<?php echo $products[$product['product_id']]['reviews']; ?>" /><br />
          <?php echo $products[$product['product_id']]['reviews']; ?></td>
        <?php } ?>
      </tr>
        <?php } ?>
      <tr>
        <td class="et"><?php echo $text_summary; ?></td>
        <?php foreach ($products as $product) { ?>
        <td class="description"><?php echo $products[$product['product_id']]['description']; ?></td>
        <?php } ?>
      </tr>
      <tr>
        <td><?php echo $text_weight; ?></td>
        <?php foreach ($products as $product) { ?>
        <td><?php echo $products[$product['product_id']]['weight']; ?></td>
        <?php } ?>
      </tr>
      <tr>
        <td class="et"><?php echo $text_dimension; ?></td>
        <?php foreach ($products as $product) { ?>
        <td><?php echo $products[$product['product_id']]['length']; ?> x <?php echo $products[$product['product_id']]['width']; ?> x <?php echo $products[$product['product_id']]['height']; ?></td>
        <?php } ?>
      </tr>
    </tbody>
    
    <?php foreach ($attribute_groups as $attribute_group) { ?>
    
    <thead>
      <tr>
        <td class="compare-attribute" colspan="<?php echo count($products) + 1; ?>"><?php echo $attribute_group['name']; ?></td>
      </tr>
    </thead>
    <?php foreach ($attribute_group['attribute'] as $key => $attribute) { ?>
    
      <tr>
        <td><?php echo $attribute['name']; ?></td>
        <?php foreach ($products as $product) { ?>
        <?php if (isset($products[$product['product_id']]['attribute'][$key])) { ?>
        <td><?php echo $products[$product['product_id']]['attribute'][$key]; ?></td>
        <?php } else { ?>
        <td></td>
        <?php } ?>
        <?php } ?>
      </tr>
    
    <?php } ?>
    <?php } ?>
    <tr>
      <td></td>
      <?php foreach ($products as $product) { ?>
      <td><a onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button"><span><?php echo $button_cart; ?></span></a></td>
      <?php } ?>
    </tr>
    <tr>
      <td class="last-1"></td>
      <?php foreach ($products as $product) { ?>
      <td class="remove last-1"><a href="<?php echo $product['remove']; ?>" class="button"><span><?php echo $button_remove; ?></span></a></td>
      <?php } ?>
    </tr>
  </table>
  </div>
  <div class="buttons">
    <div class="right"><a href="<?php echo $continue; ?>" class="button"><span><?php echo $button_continue; ?></span></a></div>
  </div>
  </div>
  <?php } else { ?>
  <div class="box-container">
  <div class="content"><?php echo $text_empty; ?></div>
  <div class="buttons">
    <div class="right"><a href="<?php echo $continue; ?>" class="button"><span><?php echo $button_continue; ?></span></a></div>
  </div>
  </div>
  <?php } ?>
  <script type="text/javascript">
$(function(){
$('.compare-info tr td:last-child').addClass('last');
});
</script>
  <?php echo $content_bottom; ?></div>
  <?php echo $column_left; ?>
	</div>
</div>
<?php echo $column_right; ?>

<?php echo $footer; ?>
  