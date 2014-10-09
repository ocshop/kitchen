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
  <div class="product-filter">
    <div class="display"><b><?php echo $text_display; ?></b> <?php echo $text_list; ?> <b>/</b> <a onclick="display('grid');"><?php echo $text_grid; ?></a></div>
      <div class="sort"><?php echo $text_sort; ?>
      <select onchange="location = this.value;">
        <?php foreach ($sorts as $sorts) { ?>
        <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
        <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
        <?php } else { ?>
        <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
        <?php } ?>
        <?php } ?>
      </select>
    </div>  <div class="limit"><?php echo $text_limit; ?>
      <select onchange="location = this.value;">
        <?php foreach ($limits as $limits) { ?>
        <?php if ($limits['value'] == $limit) { ?>
        <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
        <?php } else { ?>
        <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
        <?php } ?>
        <?php } ?>
      </select>
    </div>
<div class="product-compare"><a href="<?php echo $compare; ?>" id="compare-total"><?php echo $text_compare; ?></a></div>
  </div>
  
  <div class="product-grid">
    <ul class="row">
		<?php $i=0; foreach ($products as $product) { $i++; ?>
		<?php 
			if ($i%3==1) {
				$a='first-in-line';
			}
			elseif ($i%3==0) {
				$a='last-in-line';
			}
			else {
				$a='';
			}
		?>
		<li class="span3 <?php echo $a?>">
      <?php if ($product['thumb']) { ?>
      <div class="image"><a href="<?php echo $product['href']; ?>"><img id="img_<?php echo $product['product_id']; ?>" src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
      <?php } ?>
      <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
      <div class="description"><?php echo $product['description']; ?></div>
      <?php if ($product['price']) { ?>
      <div class="price">
        <?php if (!$product['special']) { ?>
        <?php echo $product['price']; ?>
        <?php } else { ?>
       <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span> 
        <?php } ?>
        <?php if ($product['tax']) { ?>
        <br />
        <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
        <?php } ?>
      </div>
      <?php } ?>
      <div class="cart-button">
				<div class="cart"><a onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button" title="<?php echo $button_cart; ?>"><!--<i class="icon-shopping-cart"></i>--><span><?php echo $button_cart; ?></span></a></div>
				<div class="wishlist"><a class="tooltip-1 " title="<?php echo $button_wishlist; ?>"  onclick="addToWishList('<?php echo $product['product_id']; ?>');"><i class="icon-star"></i></a></div>
				<div class="compare"><a class="tooltip-1" title="<?php echo $button_compare; ?>"  onclick="addToCompare('<?php echo $product['product_id']; ?>');"><i class="icon-bar-chart"></i></a></div>
				<div class="clear"></div>
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
  <div class="pagination"><?php echo $pagination; ?></div>
  <?php } else { ?>
  <div class="box-container">
  <div class="content"><?php echo $text_empty; ?></div>
  <div class="buttons">
    <div class="right"><a href="<?php echo $continue; ?>" class="button"><span><?php echo $button_continue; ?></span></a></div>
  </div>
  </div>
  <?php }?>
  <?php echo $content_bottom; ?></div>
  <?php echo $column_left; ?>
	</div>
</div>
<?php echo $column_right; ?>
  
<script type="text/javascript"><!--
function display(view) {
	if (view == 'list') {
		$('.product-grid ').attr('class', 'product-list');
		$('.product-list ul').removeClass('row');
		$('.product-list ul li').removeClass('span3');
		$('.product-list ul li').each(function(index, element) {
			html = '';
					html += '<div class="row">';
			var image = $(element).find('.image').html();
			
			if (image != null) {
				html += '<div class="image span2">' + image + '</div>';
			}
			html += '<div class="left span7">';
				html += '<div class="name">' + $(element).find('.name').html() + '</div>';
				html += '<div class="description">' + $(element).find('.description').html() + '</div>';
				var price = $(element).find('.price').html();
				if (price != null) {
					html += '<div class="price">' + price  + '</div>';
				}
				html += '<div class="cart-button">';
				html += '<div class="cart">' + $(element).find('.cart').html() + '</div>';
				html += '<div class="wishlist">' + $(element).find('.wishlist').html() + '</div>';
				html += '<div class="compare">' + $(element).find('.compare').html() + '</div>';
				html += '<div class="clear">' + $(element).find('.clear').html() + '</div>';
				html += '</div>';
				var rating = $(element).find('.rating').html();
				if (rating != null) {
					html += '<div class="rating">' + rating + '</div>';
				}
				html += '</div>';
				html += '</div>';
			

						
			$(element).html(html);
		});		
		
		$('.display').html('<b><?php echo $text_display; ?></b> <div id="list_b"><i class="icon-list"></i></div> <a id="grid_a" onclick="display(\'grid\');"><i class="icon-th"></i></a>');
		
		$.totalStorage('display', 'list'); 
	} else {
		$('.product-list').attr('class', 'product-grid');
		$('.product-grid ul').addClass('row');
		$('.product-grid ul li').addClass('span3');
		$('.product-grid ul li').each(function(index, element) {
			html = '';
					
			var image = $(element).find('.image').html();
			
			if (image != null) {
				html += '<div class="image">' + image + '</div>';
			}
			html += '<div class="left">';
		
			
			
			
			html += '<div class="name">' + $(element).find('.name').html() + '</div>';
			var price = $(element).find('.price').html();
			
			if (price != null) {
				html += '<div class="price">' + price  + '</div>';
			}
			html += '<div class="description">' + $(element).find('.description').html() + '</div>';
			
			
			html += '<div class="cart-button">';
			html += '<div class="cart">' + $(element).find('.cart').html() + '</div>';
			html += '<div class="wishlist">' + $(element).find('.wishlist').html() + '</div>';
			html += '<div class="compare">' + $(element).find('.compare').html() + '</div>';
			html += '<div class="clear">' + $(element).find('.clear').html() + '</div>';
			html += '</div>';
			var rating = $(element).find('.rating').html();
			
			if (rating != null) {
				html += '<div class="rating">' + rating + '</div>';
			}
			
			html += '</div>';
			$(element).html(html);
		});	
					
		$('.display').html('<b><?php echo $text_display; ?></b> <a id="list_a" onclick="display(\'list\');"><i class="icon-list"></i></a>  <div id="grid_b"><i class="icon-th"></i></i></div>');
		
		$.totalStorage('display', 'grid');
	}
	if ($('body').width() > 940) {
	// tooltip demo
		$('.tooltip-toggle').tooltip({
		selector: "a[data-toggle=tooltip]"
		})
		$('.tooltip-1').tooltip({
			placement:'bottom'
		})
		$('.tooltip-2').tooltip({
			placement:'top'
		})
		}
	
}

view = $.totalStorage('display');

if (view) {
	display(view);
} else {
	display('grid');
}
//--></script>
<?php echo $footer; ?>