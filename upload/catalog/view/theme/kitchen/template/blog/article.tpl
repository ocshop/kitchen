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
	<div class="span9">
		<h1><?php echo $heading_title; ?></h1>
	</div>
	</div>
	</div>
	<div class="tabs">
		<div class="tab-content">
			<?php echo $description; ?>
			
			<div class="blog-right">
			<div class="description">  
	  <?php if ($review_status) { ?>
		<div class="review">
				<div class="btn-rew">
				<img src="catalog/view/theme/kitchen/image/stars-<?php echo $rating; ?>.png" alt="<?php echo $reviews; ?>" />&nbsp;&nbsp;
					<a onclick="document.getElementById('tab-review').scrollIntoView();"><?php echo $reviews; ?></a>
					<a onclick="document.getElementById('tab-review').scrollIntoView();"><i class="icon-pencil"></i><?php echo $text_write; ?></a>
			</div>
		
      <div class="pluso" data-background="transparent" data-options="small,round,line,horizontal,nocounter,theme=04" data-services="vkontakte,odnoklassniki,moimir,facebook,twitter,google"></div>
      </div>
      <?php } ?>
	  </div>
	  </div>
	  
	  <?php if ($download_status) { ?>
  <div class="blog-info">
  <?php if($downloads){ ?>
  <br />
	<?php foreach($downloads as $download){ ?>
	<a href="<?php echo $download['href']; ?>" title=""><i class="fa fa-floppy-o"></i><?php echo $download['name']; ?> <?php echo " (". $download['size'] .")";?></a><br>
	<?php } ?>
  <br />
  <?php } ?> 
  </div>
  <?php } ?>
			
		</div>
	</div>
	
	<?php if ($products) { ?>
  <h1 class="style-1 mt0"><?php echo $tab_related_product;?></h1>
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
  
  <?php if ($articles) { ?>
  <h1 class="style-1 mt0"><?php echo $tab_related;?></h1>
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
  </div>
  <?php echo $content_bottom; ?></div>
  <?php echo $column_left; ?>
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
$('#review .pagination a').live('click', function() {
	$('#review').fadeOut('slow');
		
	$('#review').load(this.href);
	
	$('#review').fadeIn('slow');
	
	return false;
});			

$('#review').load('index.php?route=blog/article/review&article_id=<?php echo $article_id; ?>');

$('#button-review').bind('click', function() {
	$.ajax({
		url: 'index.php?route=blog/article/write&article_id=<?php echo $article_id; ?>',
		type: 'post',
		dataType: 'json',
		data: 'name=' + encodeURIComponent($('input[name=\'name\']').val()) + '&text=' + encodeURIComponent($('textarea[name=\'text\']').val()) + '&rating=' + encodeURIComponent($('input[name=\'rating\']:checked').val() ? $('input[name=\'rating\']:checked').val() : '') + '&captcha=' + encodeURIComponent($('input[name=\'captcha\']').val()),
		beforeSend: function() {
			$('.success, .warning').remove();
			$('#button-review').attr('disabled', true);
			$('#rev').after('<div class="attention"><img src="catalog/view/theme/default/image/loading.gif" alt="" /> <?php echo $text_wait; ?></div>');
		},
		complete: function() {
			$('#button-review').attr('disabled', false);
			$('.attention').remove();
		},
		success: function(data) {
			if (data['error']) {
				$('#rev').after('<div class="warning">' + data['error'] + '</div>');
			}
			
			if (data['success']) {
				$('#rev').after('<div class="success">' + data['success'] + '</div>');
								
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
<script type="text/javascript">(function() {
  if (window.pluso)if (typeof window.pluso.start == "function") return;
  if (window.ifpluso==undefined) { window.ifpluso = 1;
    var d = document, s = d.createElement('script'), g = 'getElementsByTagName';
    s.type = 'text/javascript'; s.charset='UTF-8'; s.async = true;
    s.src = ('https:' == window.location.protocol ? 'https' : 'http')  + '://share.pluso.ru/pluso-like.js';
    var h=d[g]('body')[0];
    h.appendChild(s);
  }})();</script>  
<?php echo $footer; ?>