<script type="text/javascript">
		(function($){$.fn.equalHeights=function(minHeight,maxHeight){tallest=(minHeight)?minHeight:0;this.each(function(){if($(this).height()>tallest){tallest=$(this).height()}});if((maxHeight)&&tallest>maxHeight)tallest=maxHeight;return this.each(function(){$(this).height(tallest)})}})(jQuery)
	$(window).load(function(){
		if($(".maxheight").length){
		$(".maxheight").equalHeights()}
	})
</script>

<script type="text/javascript">
$(document).ready(function(){
$(function(){
$('.new-products  li ').last().addClass('last');
});
}); 
</script>
	<div class="box new-products">
		<div class="box-heading"><?php echo $heading_title; ?></div>
		<div class="box-content">
			<div class="box-product">
				<ul class="row">
		  <?php $i=0; foreach ($products as $product) { $i++ ?>
		  <?php 
			   $perLine = 4;
			   $spanLine = 3;
			   $last_line = "";
							$total = count($products);
							$totModule = $total%$perLine;
							if ($totModule == 0)  { $totModule = $perLine;}
							if ( $i > $total - $totModule) { $last_line = " last_line";}
							if ($i%$perLine==1) {
								$a='first-in-line';
							}
							elseif ($i%$perLine==0) {
								$a='last-in-line';
							}
							else {
								$a='';
							}
						?>
						<li class="<?php echo $a. $last_line ;?> span<?php echo $spanLine ;?>">
							<div class="image2">
								<?php if ($product['thumb']) { ?><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a><?php } ?>
								
							</div>
							<div class="inner">
								<div class="f-left">
									
									<?php if ($product['price']) { ?>
									<div class="price">
										<?php if (!$product['special']) { ?>
										<?php echo $product['price']; ?>
										<?php } else { ?>
										<span class="price-new"><?php echo $product['special']; ?></span><span class="price-old"><?php echo $product['price']; ?></span>
										<?php } ?>
									</div>
									<?php } ?>
									<div class="name maxheight"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
									<!--<?php if ($product['description']) {?>
										<div class="description"><?php echo mb_substr($product['description1'],0,70,'UTF-8').'...';?></div>
									<?php } ?>-->
								</div>
								<div class="cart-button">
									<div class="cart"><a title="<?php echo $button_cart; ?>" data-id="<?php echo $product['product_id']; ?>;" class="button addToCart"><i class="icon-shopping-cart"></i><span><?php echo $button_cart; ?></span></a></div>
									<!--<a href="<?php echo $product['href']; ?>" class="button details"><span><?php echo $button_details; ?></span></a>
									
									<div class="compare"><a class="tooltip-1" title="<?php echo $button_compare; ?>"  onclick="addToCompare('<?php echo $product['product_id']; ?>');"><i class="icon-bar-chart"></i><span><?php echo $button_compare; ?></span></a></div>
									<div class="wishlist"><a class="tooltip-1" title="<?php echo $button_wishlist; ?>"  onclick="addToWishList('<?php echo $product['product_id']; ?>');"><i class="icon-star"></i><span><?php echo $button_wishlist; ?></span></a></div>-->
									<span class="clear"></span>
								</div>
								<div class="clear"></div>
								<div class="rating">
								<?php if ($product['rating']) { ?>
									<img height="13" src="catalog/view/theme/kitchen/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" />
								<?php } ?>
								</div>
							</div>
								<div class="clear"></div>
						</li>
					<?php } ?>
				</ul>
			</div>
		</div>
	</div>