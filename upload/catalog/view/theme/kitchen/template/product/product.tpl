<?php echo $header; ?>
<div class="<?php if ($column_right) { ?>span9<?php } else {?>span12<?php } ?>">
	<div class="row">
<div class="<?php if ($column_left or $column_right) { ?>span9<?php } ?> <?php if ($column_left and $column_right) { ?>span6<?php } ?> <?php if (!$column_right and !$column_left) { ?>span12 <?php } ?>" id="content"><?php echo $content_top; ?>
	<div class="breadcrumb">
	<?php foreach ($breadcrumbs as $breadcrumb) { ?>
	<?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
	<?php } ?>
	</div>
	<div class="product-info">
		<div class="row">

		<div class="span3">
			<h1 class="view"><?php echo $heading_title; ?></h1>
	
	<script type="text/javascript">
		jQuery(document).ready(function(){
		var myPhotoSwipe = $("#gallery a").photoSwipe({ enableMouseWheel: false , enableKeyboard: false, captionAndToolbarAutoHideDelay:0 });
		});
	</script>
	
	<?php $i=1; if ($thumb || $images) { $i++  ?>
	<div id="full_gallery">
		<ul id="gallery">
			<?php foreach ($images as $image) { ?>
			<li><a href="<?php echo $image['popup']; ?>" data-something="something<?php echo $i?>" data-another-thing="anotherthing<?php echo $i?>"><img src="<?php echo $image['popup']; ?>" alt="<?php echo $heading_title; ?>" /></a></li>
				<?php } ?>
		</ul>
		
	</div>
	<?php } ?>

		<?php if ($thumb || $images) { ?>
		<div id="default_gallery" class="left spacing">
			
			<?php foreach ($images as $image) { ?>
			<div class="zoom-top">
				<a href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>"  data-gal="prettyPhoto[gallery1]" >
					<img src="" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
				</a>
			</div>
			<?php } ?>
			<?php if ($thumb) { ?>
			<div class="image"><?php echo $sticker; ?>
				<a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" class = 'cloud-zoom' id='zoom1' rel="position: 'right'" >
					<img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
				</a>
				<a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>">
				</a>
			</div>
			<?php } ?>
			
			<?php if ($images) { ?>
				<div class="image-additional">
					<ul id="image-additional">
						<?php foreach ($images as $image) { ?>
						 <li>
							<a href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" class="cloud-zoom-gallery" rel="useZoom: 'zoom1', smallImage: '<?php echo $image['popup']; ?>' ">
								<img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
							</a>
						</li>
						<?php } ?>
					</ul>
					<div class="clear"></div>
				</div>
			<?php } ?>
		</div>
		<?php } ?>
		</div>
	<div class="span6">
		<h1><?php echo $heading_title; ?></h1>
	  <div class="description">
		<div class="product-section">
			<?php if ($manufacturer) { ?>
			<span><?php echo $text_manufacturer; ?></span> <a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a><br />
			<?php } ?>
			<span><?php echo $text_model; ?></span> <?php echo $model; ?><br />
			<?php if ($reward) { ?>
			<span><?php echo $text_reward; ?></span> <?php echo $reward; ?><br />
			<?php } ?>
			<span><?php echo $text_stock; ?></span><div class="prod-stock"><?php echo $stock; ?></div>
		</div>
		
	  <?php if ($price) { ?>
	  <div class="price">
		<span class="text-price"><?php echo $text_price; ?></span>
		<?php if (!$special) { ?>
		<span class="price-new"><?php echo $price; ?></span>
		<?php } else { ?>
		<span class="price-new"><?php echo $special; ?></span><span class="price-old"><?php echo $price; ?></span> 
		<?php } ?>
		<?php if ($tax) { ?>
		<span class="price-tax"><?php echo $text_tax; ?> <?php echo $tax; ?></span>
		<?php } ?>
		<?php if ($points) { ?>
		<span class="reward"><small><?php echo $text_points; ?> <?php echo $points; ?></small></span>
		<?php } ?>
		<?php if ($discounts) { ?>
		<div class="discount">
		  <?php foreach ($discounts as $discount) { ?>
		  <?php echo sprintf($text_discount, $discount['quantity'], $discount['price']); ?><br />
		  <?php } ?>
		</div>
		<?php } ?>
	  </div>
	  <?php } ?>
	   <?php if (!empty($profiles)): ?>
      <div class="option">
          <h2><span class="required">*</span><?php echo $text_payment_profile ?></h2>
          <br />
          <select name="profile_id">
              <option value=""><?php echo $text_select; ?></option>
              <?php foreach ($profiles as $profile): ?>
              <option value="<?php echo $profile['profile_id'] ?>"><?php echo $profile['name'] ?></option>
              <?php endforeach; ?>
          </select>
          <br />
          <br />
          <span id="profile-description"></span>
          <br />
          <br />
      </div>
      <?php endif; ?>
	  <?php if ($options) { ?>
	  <div class="options">
		<h2><?php echo $text_option; ?></h2>
		<?php foreach ($options as $option) { ?>
		<?php if ($option['type'] == 'select') { ?>
		<div id="option-<?php echo $option['product_option_id']; ?>" class="option">
		  <label><?php if ($option['required']) { ?>
		  <span class="required">*</span>
		  <?php } ?>
		  <b><?php echo $option['name']; ?>:</b></label>
		  <select name="option[<?php echo $option['product_option_id']; ?>]">
			<option value=""><?php echo $text_select; ?></option>
			<?php foreach ($option['option_value'] as $option_value) { ?>
			<option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
			<?php if ($option_value['price']) { ?>
			(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
			<?php } ?>
			</option>
			<?php } ?>
		  </select>
		</div>
		<?php } ?>
		<?php if ($option['type'] == 'radio') { ?>
		<div id="option-<?php echo $option['product_option_id']; ?>" class="option">
			<label>
		  <?php if ($option['required']) { ?>
		  <span class="required">*</span>
		  <?php } ?>
		  <b><?php echo $option['name']; ?>:</b></label>
		  <?php foreach ($option['option_value'] as $option_value) { ?>
		  
		  <label class="radio" for="option-value-<?php echo $option_value['product_option_value_id']; ?>">
			  <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" /><?php echo $option_value['name']; ?>
			<?php if ($option_value['price']) { ?>
			(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
			<?php } ?>
		  </label>
		    <?php } ?>
		</div>
		<br />
		<?php } ?>
		<?php if ($option['type'] == 'checkbox') { ?>
		<div id="option-<?php echo $option['product_option_id']; ?>" class="option">
		  <label><?php if ($option['required']) { ?>
		  <span class="required">*</span>
		  <?php } ?>
		  <b><?php echo $option['name']; ?>:</b></label>
		  <?php foreach ($option['option_value'] as $option_value) { ?>
		  
		  <label class="checkbox" for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" /><?php echo $option_value['name']; ?>
			<?php if ($option_value['price']) { ?>
			(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
			<?php } ?>
		  </label>
		    <?php } ?>
		</div>
		<br />
		<?php } ?>
		<?php if ($option['type'] == 'image') { ?>
		<div id="option-<?php echo $option['product_option_id']; ?>" class="option">
		  <label><?php if ($option['required']) { ?>
		  <span class="required">*</span>
		  <?php } ?>
		  <?php echo $option['name']; ?>:</label>
			<table class="option-image">
			  <?php foreach ($option['option_value'] as $option_value) { ?>
			  <tr>
				<td style="width: 1px;"><input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" /></td>
				<td><label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" /></label></td>
				<td><label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
					<?php if ($option_value['price']) { ?>
					(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
					<?php } ?>
				  </label></td>
			  </tr>
			  <?php } ?>
			</table>
		</div>
			  
		<?php } ?>
		<?php if ($option['type'] == 'text') { ?>
		<div id="option-<?php echo $option['product_option_id']; ?>" class="option">
		  <label><?php if ($option['required']) { ?>
		  <span class="required">*</span>
		  <?php } ?>
		  <?php echo $option['name']; ?>:</label>
		  <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" />
		</div>
		<?php } ?>
		<?php if ($option['type'] == 'textarea') { ?>
		<div id="option-<?php echo $option['product_option_id']; ?>" class="option">
		 <label><?php if ($option['required']) { ?>
		  <span class="required">*</span>
		  <?php } ?>
		  <?php echo $option['name']; ?>:</label>
		  <textarea name="option[<?php echo $option['product_option_id']; ?>]" cols="40" rows="5"><?php echo $option['option_value']; ?></textarea>
		</div>
		<?php } ?>
		<?php if ($option['type'] == 'file') { ?>
		<div id="option-<?php echo $option['product_option_id']; ?>" class="option">
		  <label><?php if ($option['required']) { ?>
		  <span class="required">*</span>
		  <?php } ?>
		  <?php echo $option['name']; ?>:</label>
		  <a id="button-option-<?php echo $option['product_option_id']; ?>" class="btn"><?php echo $button_upload; ?></a>
		  <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" />
		</div>
		<br />
		<?php } ?>
		<?php if ($option['type'] == 'date') { ?>
		<div id="option-<?php echo $option['product_option_id']; ?>" class="option">
		  <label><?php if ($option['required']) { ?>
		  <span class="required">*</span>
		  <?php } ?>
		  <?php echo $option['name']; ?>:</label>
		  <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="date" />
		</div>
		<br />
		<?php } ?>
		<?php if ($option['type'] == 'datetime') { ?>
		<div id="option-<?php echo $option['product_option_id']; ?>" class="option">
		  <label><?php if ($option['required']) { ?>
		  <span class="required">*</span>
		  <?php } ?>
		  <?php echo $option['name']; ?>:</label>
		  <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="datetime" />
		</div>
		<br />
		<?php } ?>
		<?php if ($option['type'] == 'time') { ?>
		<div id="option-<?php echo $option['product_option_id']; ?>" class="option">
		  <label><?php if ($option['required']) { ?>
		  <span class="required">*</span>
		  <?php } ?>
		  <?php echo $option['name']; ?>:</label>
		  <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="time" />
		</div>
		<br />
		<?php } ?>
		<?php } ?>
	  </div>
	  <?php } ?>
	  <div class="cart">
		<div class="prod-row">
			<div class="cart-top">
				<div class="cart-top-padd form-inline">
					<label><?php echo $text_qty; ?>
						<input class="q-mini" type="text" name="quantity" size="2" value="<?php echo $minimum; ?>" />
						<input class="q-mini" type="hidden" name="product_id" size="2" value="<?php echo $product_id; ?>" />
					</label>
					<a id="button-cart" class="button-prod" ><i class="icon-shopping-cart"></i><?php echo $button_cart; ?></a>
				</div>
				<div class="extra-button">
					<div class="wishlist">
						<a   onclick="addToWishList('<?php echo $product_id; ?>');" title="<?php echo $button_wishlist; ?>"><i class="icon-star"></i><span><?php echo $button_wishlist; ?></span></a>
					</div>
					<div class="compare">
						<a   onclick="addToCompare('<?php echo $product_id; ?>');" title="<?php echo $button_compare; ?>"><i class="icon-bar-chart"></i><span><?php echo $button_compare; ?></span></a>
					</div>
				</div>
				<div class="clear"></div>
				<?php if ($minimum > 1) { ?>
				<div class="minimum"><?php echo $text_minimum; ?></div>
				<?php } ?>
			</div>
		</div>
		</div>
		<div class="clear"></div>
		<?php if ($review_status) { ?>
		<div class="review">
			<div>
				<img src="catalog/view/theme/kitchen/image/stars-<?php echo $rating; ?>.png" alt="<?php echo $reviews; ?>" />&nbsp;&nbsp;
				<div class="btn-rew">
					<a onclick="document.getElementById('tab-review').scrollIntoView();"><?php echo $reviews; ?></a>
					<a onclick="document.getElementById('tab-review').scrollIntoView();"><i class="icon-pencil"></i><?php echo $text_write; ?></a>
					<div class="clear"></div>
				</div>
			</div>
			<div class="clear"></div>
		</div>
		<?php } ?>
		<div class="clear"></div>
		<div class="share">
			<!-- AddThis Button BEGIN -->
			<span class='st_facebook_hcount' displayText='Facebook'></span>
			<span class='st_twitter_hcount' displayText='Tweet'></span>
			<span class='st_googleplus_hcount' displayText='Google +'></span>
			<span class='st_pinterest_hcount' displayText='Pinterest'></span>
			<script type="text/javascript" src="http://w.sharethis.com/button/buttons.js"></script>
			<script type="text/javascript">stLight.options({publisher: "00fa5650-86c7-427f-b3c6-dfae37250d99", doNotHash: false, doNotCopy: false, hashAddressBar: false});</script>
			<!-- AddThis Button END -->
		</div>
	</div>
  </div>
  </div>
	<div class="tabs">
		<div class="tab-heading">
			<?php echo $tab_description; ?>
		</div>
		<div class="tab-content">
			<?php echo $description; ?>
		</div>
	</div>
	<?php if ($attribute_groups) { ?>
	<div class="tabs">
		<div class="tab-heading">
			<?php echo $tab_attribute; ?>
		</div>
			
			<div class="tab-content">
				<table class="attribute table table-bordered" >
				<?php foreach ($attribute_groups as $attribute_group) { ?>
				<thead>
					<tr>
					<td colspan="2"><?php echo $attribute_group['name']; ?></td>
					</tr>
				</thead>
				<tbody>
					<?php foreach ($attribute_group['attribute'] as $attribute) { ?>
					<tr>
					<td><?php echo $attribute['name']; ?></td>
					<td><?php echo $attribute['text']; ?></td>
					</tr>
					<?php } ?>
				</tbody>
				<?php } ?>
				</table>
			
		</div>
	</div>
	<?php } ?>
	<?php if ($review_status) { ?>
	<div class="tabs" id="tab-review">
		<div class="tab-heading">
			<?php echo $tab_review; ?>
		</div>
		<div class="tab-content">
			<div id="review"></div>
			<h2 id="review-title"><?php echo $text_write; ?></h2>
			<label><?php echo $entry_name; ?></label>
			<input type="text" name="name" value="" />
			<br />
			<br />
			<label><?php echo $entry_review; ?></label>
			<textarea name="text" cols="40" rows="8" style="width: 93%;"></textarea>
			<div class="clear"></div>
			<span style="font-size: 11px;"><?php echo $text_note; ?></span><br />
			<br />
			<label class="inline"><?php echo $entry_rating; ?></label>
			<div class="form-inline border">
				<span class="radio"><?php echo $entry_bad; ?></span>&nbsp;
				<input type="radio" name="rating" value="1" />
				&nbsp;
				<input type="radio" name="rating" value="2" />
				&nbsp;
				<input type="radio" name="rating" value="3" />
				&nbsp;
				<input type="radio" name="rating" value="4" />
				&nbsp;
				<input type="radio" name="rating" value="5" />
				&nbsp; <span class="radio"><?php echo $entry_good; ?></span><br />
			</div>
			
			<label><?php echo $entry_captcha; ?></label>
			<input type="text" name="captcha" value="" />
			
			<img src="index.php?route=product/product/captcha" alt="" id="captcha" />
			<br />
			<div class="buttons">
			<div><a id="button-review" class="button-cont-right"><?php echo $button_continue; ?><i class="icon-circle-arrow-right"></i></a></div>
			</div>
		</div>
	</div>
	<?php } ?>
	<?php if ($tags) { ?>
	<div class="tabs">
		<div class="tab-heading">
			<?php echo $text_tags; ?>
		</div>
		<div class="tab-content">
			<div class="tags">
			<b><?php echo $text_tags; ?></b>
				<?php for ($i = 0; $i < count($tags); $i++) { ?>
					<?php if ($i < (count($tags) - 1)) { ?>
						<a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>,
					<?php } else { ?>
						<a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
					<?php } ?>
				<?php } ?>
			</div>
		</div>
	</div>
	<?php } ?>
  
  </div>
  <?php if ($products) { ?>
  <h1 class="style-1 mt0"><?php echo $tab_related;?></h1>
  <div  class="related">
	<div class="box-product"> 
		<ul class="related-slider">
			<?php foreach ($products as $product) { ?>
			<li class="related-info">
			<?php if ($product['thumb']) { ?>
			<div class="image"><?php echo $product['sticker']; ?>
				<a href="<?php echo $product['href']; ?>"><img id="img_<?php echo $product['product_id']; ?>" src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a>
				
			</div>
			<?php } ?>
			<div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
			<?php if ($product['price']) { ?>
				<div class="price">
				<?php if (!$product['special']) { ?>
				<?php echo $product['price']; ?>
				<?php } else { ?>
				<span class="price-new"><?php echo $product['special']; ?></span><span class="price-old"><?php echo $product['price']; ?></span>
				<?php } ?>
				</div>
				<?php } ?>
			<div class="cart-button">
				<div class="cart">
					<a title="<?php echo $button_cart; ?>" onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button ">
						<span><?php echo $button_cart; ?></span>
					</a>
				</div>
				<div class="wishlist"><a class="tooltip-2" title="<?php echo $button_wishlist; ?>"  onclick="addToWishList('<?php echo $product['product_id']; ?>');"><i class="icon-star"></i><span><?php echo $button_wishlist; ?></span></a></div>
				<div class="compare"><a class="tooltip-2" title="<?php echo $button_compare; ?>"  onclick="addToCompare('<?php echo $product['product_id']; ?>');"><i class="icon-bar-chart"></i><span><?php echo $button_compare; ?></span></a></div>
				<span class="clear"></span>
			</div>
			<div class="rating">
			<?php if ($product['rating']) { ?>
				<img height="13" src="catalog/view/theme/kitchen/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" />
			<?php } ?>
			</div>
			</li>
			<?php } ?>
		</ul>
		</div>
  </div>
  <?php } ?>
  
  <?php if ($products2) { ?>
  <h1 class="style-1 mt0"><?php echo $tab_related2;?></h1>
  <div  class="related">
	<div class="box-product"> 
		<ul class="related-slider">
			<?php foreach ($products2 as $product) { ?>
			<li class="related-info">
			<?php if ($product['thumb']) { ?>
			<div class="image"><?php echo $product['sticker']; ?>
				<a href="<?php echo $product['href']; ?>"><img id="img_<?php echo $product['product_id']; ?>" src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a>
				
			</div>
			<?php } ?>
			<div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
			<?php if ($product['price']) { ?>
				<div class="price">
				<?php if (!$product['special']) { ?>
				<?php echo $product['price']; ?>
				<?php } else { ?>
				<span class="price-new"><?php echo $product['special']; ?></span><span class="price-old"><?php echo $product['price']; ?></span>
				<?php } ?>
				</div>
				<?php } ?>
			<div class="cart-button">
				<div class="cart">
					<a title="<?php echo $button_cart; ?>" onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button ">
						<span><?php echo $button_cart; ?></span>
					</a>
				</div>
				<div class="wishlist"><a class="tooltip-2" title="<?php echo $button_wishlist; ?>"  onclick="addToWishList('<?php echo $product['product_id']; ?>');"><i class="icon-star"></i><span><?php echo $button_wishlist; ?></span></a></div>
				<div class="compare"><a class="tooltip-2" title="<?php echo $button_compare; ?>"  onclick="addToCompare('<?php echo $product['product_id']; ?>');"><i class="icon-bar-chart"></i><span><?php echo $button_compare; ?></span></a></div>
				<span class="clear"></span>
			</div>
			<div class="rating">
			<?php if ($product['rating']) { ?>
				<img height="13" src="catalog/view/theme/kitchen/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" />
			<?php } ?>
			</div>
			</li>
			<?php } ?>
		</ul>
		</div>
  </div>
  <?php } ?>
  
  <?php if ($articles) { ?>
  <h1 class="style-1 mt0"><?php echo $tab_blog_related;?></h1>
  <div  class="related">
	<div class="box-product"> 
		<ul class="related-slider">
			<?php foreach ($articles as $article) { ?>
			<li class="related-info">
			<?php if ($article['thumb']) { ?>
			<div class="image">
			<a href="<?php echo $article['href']; ?>"><img id="img_<?php echo $article['article_id']; ?>" src="<?php echo $article['thumb']; ?>" alt="<?php echo $article['name']; ?>" /></a>
			</div>
			<?php } ?>
			<div class="name"><a href="<?php echo $article['href']; ?>"><?php echo $article['name']; ?></a></div>
			<div class="description-article"><?php echo $article['description']; ?> <a href="<?php echo $article['href']; ?>">...&raquo;</a></div>
			<div class="rating">
			<?php if ($article['rating']) { ?>
				<img height="13" src="catalog/view/theme/kitchen/image/stars-<?php echo $article['rating']; ?>.png" alt="<?php echo $article['reviews']; ?>" />
			<?php } ?>
			</div>
			</li>
			<?php } ?>
		</ul>
		</div>
  </div>
  <?php } ?>
  
  <?php echo $content_bottom; ?></div>
  <?php echo $column_left; ?>
	</div>
</div>
<?php echo $column_right; ?>
<script type="text/javascript"><!--
$(document).ready(function() {
	$('.colorbox').colorbox({
		overlayClose: true,
		opacity: 0.5,
		rel: "colorbox"
	});
});
//--></script> 
<script type="text/javascript"><!--
  
  $('select[name="profile_id"], input[name="quantity"]').change(function(){
    $.ajax({
		url: 'index.php?route=product/product/getRecurringDescription',
		type: 'post',
		data: $('input[name="product_id"], input[name="quantity"], select[name="profile_id"]'),
		dataType: 'json',
        beforeSend: function() {
            $('#profile-description').html('');
        },
		success: function(json) {
			$('.success, .warning, .attention, information, .error').remove();
            
			if (json['success']) {
                $('#profile-description').html(json['success']);
			}	
		}
	});
});
  
$('#button-cart').bind('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: $('.product-info input[type=\'text\'], .product-info input[type=\'hidden\'], .product-info input[type=\'radio\']:checked, .product-info input[type=\'checkbox\']:checked, .product-info select, .product-info textarea'),
		dataType: 'json',
		success: function(json) {
			$('.success, .warning, .attention, information, .error').remove();
			
			if (json['error']) {
				if (json['error']['option']) {
					for (i in json['error']['option']) {
						$('#option-' + i).after('<span class="error">' + json['error']['option'][i] + '</span>');
					}
				}
				if (json['error']['profile']) {
                    $('select[name="profile_id"]').after('<span class="error">' + json['error']['profile'] + '</span>');
                }
			} 
			
			if (json['success']) {
				$('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<span><i class="icon-remove-sign"></i></span></div>');
					
				$('.success').fadeIn('slow');
					
				$('#cart-total').html(json['total']);
				$('#cart-total2').html(json['total']);
				$('#cart').load('index.php?route=module/cart #cart > *');
				$('html, body').animate({ scrollTop: 0 }, 'slow'); 
			}	
			setTimeout(function() {$('.success').fadeOut(1000)},3000)
		}
	});
});
//--></script>
<?php if ($options) { ?>
<script type="text/javascript" src="catalog/view/javascript/jquery/ajaxupload.js"></script>
<?php foreach ($options as $option) { ?>
<?php if ($option['type'] == 'file') { ?>
<script type="text/javascript"><!--
new AjaxUpload('#button-option-<?php echo $option['product_option_id']; ?>', {
	action: 'index.php?route=product/product/upload',
	name: 'file',
	autoSubmit: true,
	responseType: 'json',
	onSubmit: function(file, extension) {
		$('#button-option-<?php echo $option['product_option_id']; ?>').after('<img src="catalog/view/theme/kitchen/image/loading.gif" class="loading" style="padding-left: 5px;" />');
		$('#button-option-<?php echo $option['product_option_id']; ?>').attr('disabled', true);
	},
	onComplete: function(file, json) {
		$('#button-option-<?php echo $option['product_option_id']; ?>').attr('disabled', false);
		
		$('.error').remove();
		
		if (json['success']) {
			alert(json['success']);
			
			$('input[name=\'option[<?php echo $option['product_option_id']; ?>]\']').attr('value', json['file']);
		}
		
		if (json['error']) {
			$('#option-<?php echo $option['product_option_id']; ?>').after('<span class="error">' + json['error'] + '</span>');
		}
		
		$('.loading').remove();	
	}
});
//--></script>
<?php } ?>
<?php } ?>
<?php } ?>
<script type="text/javascript"><!--
$('#review .pagination a').live('click', function() {
	$('#review').fadeOut('slow');
		
	$('#review').load(this.href);
	
	$('#review').fadeIn('slow');
	
	return false;
});			

$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

$('#button-review').bind('click', function() {
	$.ajax({
		url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
		type: 'post',
		dataType: 'json',
		data: 'name=' + encodeURIComponent($('input[name=\'name\']').val()) + '&text=' + encodeURIComponent($('textarea[name=\'text\']').val()) + '&rating=' + encodeURIComponent($('input[name=\'rating\']:checked').val() ? $('input[name=\'rating\']:checked').val() : '') + '&captcha=' + encodeURIComponent($('input[name=\'captcha\']').val()),
		beforeSend: function() {
			$('.success, .warning').remove();
			$('#button-review').attr('disabled', true);
			$('#review-title').after('<div class="attention"><img src="catalog/view/theme/kitchen/image/loading.gif" alt="" /> <?php echo $text_wait; ?></div>');
		},
		complete: function() {
			$('#button-review').attr('disabled', false);
			$('.attention').remove();
		},
		success: function(data) {
			if (data['error']) {
				$('#review-title').after('<div class="warning">' + data['error'] + '</div>');
			}
			
			if (data['success']) {
				$('#review-title').after('<div class="success">' + data['success'] + '</div>');
								
				$('input[name=\'name\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').attr('checked', '');
				$('input[name=\'captcha\']').val('');
			}
		}
	});
});
//--></script> 
<script type="text/javascript"><!--
$('#tabs a').tabs();
//--></script> 
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-timepicker-addon.js"></script> 
<script type="text/javascript"><!--
$(document).ready(function() {
	if ($.browser.msie && $.browser.version == 6) {
		$('.date, .datetime, .time').bgIframe();
	}

	$('.date').datepicker({dateFormat: 'yy-mm-dd'});
	$('.datetime').datetimepicker({
		dateFormat: 'yy-mm-dd',
		timeFormat: 'h:m'
	});
	$('.time').timepicker({timeFormat: 'h:m'});
});
//--></script> 
<?php echo $footer; ?>