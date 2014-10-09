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
					<?php if ($review['prod_thumb']) { ?><a href="<?php echo $review['prod_href']; ?>"><img id="img_<?php echo $review['product_id']; ?>" src="<?php echo $review['prod_thumb']; ?>" alt="<?php echo $review['prod_name']; ?>" /></a><?php } ?>
				</div>

				<div class="inner">
					<div class="f-left">
						<div class="name maxheight-spec"><a href="<?php echo $review['prod_href']; ?>"><?php echo $review['prod_name']; ?></a></div>
						<div style="margin:0 10px;"><?php echo $review['description']?> <a href="<?php echo $review['href']?>">...&raquo;</a></div>
						<div style="margin-bottom:20px;margin-right:10px;font-style:italic;font-weight:bold;text-align:right;"><?php echo $review['author']?></div>
						</div>
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
	<div style="margin:0px;text-align:right;width:100%;"><a href="<?php echo $link_all_reviews; ?>" class="button"><span><?php echo $text_all_reviews;?></span></a></div>
	</div>
  </div>
</div>