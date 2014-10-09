<script type="text/javascript">
	if ($('.container').width() > 723) {
		(function($){$.fn.equalHeights=function(minHeight,maxHeight){tallest=(minHeight)?minHeight:0;this.each(function(){if($(this).height()>tallest){tallest=$(this).height()}});if((maxHeight)&&tallest>maxHeight)tallest=maxHeight;return this.each(function(){$(this).height(tallest)})}})(jQuery)
	$(window).load(function(){
		if($(".maxheight-spec").length){
		$(".maxheight-spec").equalHeights()}
	});
	};
</script>
<div class="box specials">
   <?php if ($header) {?>
  <div class="box-heading special-heading"><?php echo $header; ?></div>
  <?php } ?>
  <div class="box-content">
	<div class="box-product">
		<ul class="row">
		  <?php $i=0; foreach ($reviews as $review) { $i++ ?>
		  <?php 
			   $perLine = 4;
			   $spanLine = 3;
			   $last_line = "";
							$total = count($reviews);
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
					<?php if ($review['articl_thumb']) { ?><a href="<?php echo $review['articl_href']; ?>"><img id="img_<?php echo $review['article_id']; ?>" src="<?php echo $review['articl_thumb']; ?>" alt="<?php echo $review['articl_name']; ?>" /></a><?php } ?>
				</div>

				<div class="inner">
					<div class="f-left">
						<div class="name maxheight-spec"><a href="<?php echo $review['articl_href']; ?>"><?php echo $review['articl_name']; ?></a></div>
						<div style="margin:0 10px;"><?php echo $review['description']?></div>
						<div style="margin-bottom:20px;margin-right:10px;font-style:italic;font-weight:bold;text-align:right;"><?php echo $review['author']?></div>
						</div>
					<div class="cart-button">
									<div class="cart"><a class="button addToCart" href="<?php echo $review['href']?>"><i class=" icon-eye-open"></i></a></div>
									<span class="clear"></span>
								</div>
								<div class="clear"></div>
					<?php if ($review['rating']) { ?>
					<div class="rating">
						<img height="13" src="catalog/view/theme/kitchen/image/stars-<?php echo $review['rating']; ?>.png" />
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
