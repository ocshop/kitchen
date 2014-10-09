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
$('.mostviewed  li ').last().addClass('last');
});
}); 
</script>
	<div class="box mostviewed">
		<div class="box-heading"><?php echo $heading_title; ?></div>
		<div class="box-content">
			<div class="box-product">
				<ul class="row">
		  <?php $i=0; foreach ($articles as $article) { $i++ ?>
		  <?php 
			   $perLine = 4;
			   $spanLine = 3;
			   $last_line = "";
							$total = count($articles);
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
								<?php if ($article['thumb']) { ?><a href="<?php echo $article['href']; ?>"><img src="<?php echo $article['thumb']; ?>" alt="<?php echo $article['name']; ?>" /></a><?php } ?>
								
							</div>
							<div class="inner">
								<div class="f-left">
									<div class="name maxheight"><a href="<?php echo $article['href']; ?>"><?php echo $article['name']; ?></a></div>
								</div>
								<div style="margin: 0 10px;" class="description"><?php echo $article['description']; ?> ...</div>
								<div class="cart-button">
									<div class="cart"><a class="button addToCart" href="<?php echo $article['href']?>"><i class=" icon-eye-open"></i></a></div>
									<span class="clear"></span>
								</div>
								<div class="clear"></div>
								<div class="rating">
								<?php if ($article['rating']) { ?>
									<img height="13" src="catalog/view/theme/kitchen/image/stars-<?php echo $article['rating']; ?>.png" alt="<?php echo $article['reviews']; ?>" />
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