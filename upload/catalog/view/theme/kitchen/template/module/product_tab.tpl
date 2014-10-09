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
$('.tab-contents  li ').last().addClass('last');
});
}); 
</script>
<div id="tabs-<?php echo $module; ?>" class="htabs">
	<?php if($latest_products){ ?>
	<a href="#tab-latest-<?php echo $module; ?>"><?php echo $tab_latest; ?></a>
	<?php } ?>
	<?php if($featured_products){ ?>
	<a href="#tab-featured-<?php echo $module; ?>"><?php echo $tab_featured; ?></a>
	<?php } ?>
	<?php if($bestseller_products){ ?>
	<a href="#tab-bestseller-<?php echo $module; ?>"><?php echo $tab_bestseller; ?></a>
	<?php } ?>
	<?php if($special_products){ ?>
	<a href="#tab-special-<?php echo $module; ?>"><?php echo $tab_special; ?></a>
	<?php } ?>
 </div>
<?php if($latest_products){ ?>
 <div id="tab-latest-<?php echo $module; ?>" class="tab-contents">
	<div class="box">
		<div class="box-content">
    <div class="box-product">
				<ul class="row">
		  <?php $i=0; foreach ($latest_products as $product) { $i++ ?>
		  <?php 
			   $perLine = 4;
			   $spanLine = 3;
			   $last_line = "";
							$total = count($latest_products);
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
								</div>
								<div class="cart-button">
									<div class="cart"><a title="<?php echo $button_cart; ?>" data-id="<?php echo $product['product_id']; ?>;" class="button addToCart"><i class="icon-shopping-cart"></i><span><?php echo $button_cart; ?></span></a></div>
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
 </div>
<?php } ?>
<?php if($featured_products){ ?>
  <div id="tab-featured-<?php echo $module; ?>" class="tab-contents">
    <div class="box">
		<div class="box-content">
    <div class="box-product">
				<ul class="row">
		  <?php $i=0; foreach ($featured_products as $product) { $i++ ?>
		  <?php 
			   $perLine = 4;
			   $spanLine = 3;
			   $last_line = "";
							$total = count($featured_products);
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
								</div>
								<div class="cart-button">
									<div class="cart"><a title="<?php echo $button_cart; ?>" data-id="<?php echo $product['product_id']; ?>;" class="button addToCart"><i class="icon-shopping-cart"></i><span><?php echo $button_cart; ?></span></a></div>
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
 </div>
<?php } ?>

<?php if($bestseller_products){ ?>
 <div id="tab-bestseller-<?php echo $module; ?>" class="tab-contents">
    <div class="box">
  <div class="box-content">
	<div class="box-product">
		<ul class="row">
		  <?php $i=0; foreach ($bestseller_products as $product) { $i++ ?>
		  <?php 
			   $perLine = 4;
			   $spanLine = 3;
			   $last_line = "";
							$total = count($bestseller_products);
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
					<?php if ($product['thumb']) { ?><a href="<?php echo $product['href']; ?>"><img id="img_<?php echo $product['product_id']; ?>" src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name'];?>" /></a><?php } ?>
					
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
						<div class="name maxheight-best"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
					</div>
					<div class="cart-button">
						<div class="cart"><a title="<?php echo $button_cart; ?>" data-id="<?php echo $product['product_id']; ?>;" class="button addToCart"><i class="icon-shopping-cart"></i><span><?php echo $button_cart; ?></span></a></div>
						<span class="clear"></span>
					</div>
					<div class="clear"></div>
					<div class="rating">
						<?php if ($product['rating']) { ?>
							<img height="13" src="catalog/view/theme/theme152/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" />
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
 </div>
<?php } ?>

<?php if($special_products){ ?>
 <div id="tab-special-<?php echo $module; ?>" class="tab-contents">
    <div class="box">
  <div class="box-content">
	<div class="box-product">
		<ul class="row">
		  <?php $i=0; foreach ($special_products as $product) { $i++ ?>
		  <?php 
			   $perLine = 4;
			   $spanLine = 3;
			   $last_line = "";
							$total = count($special_products);
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
					<?php if ($product['thumb']) { ?><a href="<?php echo $product['href']; ?>"><img id="img_<?php echo $product['product_id']; ?>" src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a><?php } ?>
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
						<div class="name maxheight-spec"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
						</div>
						<div class="cart-button">
							<div class="cart">
								<a title="<?php echo $button_cart; ?>" data-id="<?php echo $product['product_id']; ?>;" class="button addToCart">
									<i class="icon-shopping-cart"></i>
									<span><?php echo $button_cart; ?></span>
								</a>
							</div>
							<span class="clear"></span>
						</div>
					<div class="clear"></div>
					<?php if ($product['rating']) { ?>
					<div class="rating">
						<img height="13" src="catalog/view/theme/kitchen/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" />
					</div>
					<?php } ?>
				</div>
				<div class="clear"></div>
			</li>
		  <?php } ?>
	   </ul>
	</div>
  </div>
</div>
 </div>
<?php } ?>

<script type="text/javascript">
$('#tabs-<?php echo $module; ?> a').tabs();
</script> 