<?php echo $header; ?>
<div class="<?php if ($column_right) { ?>span9<?php } else {?>span12<?php } ?>">
	<div class="row testimonials">
<div class="<?php if ($column_left or $column_right) { ?>span9<?php } ?> <?php if ($column_left and $column_right) { ?>span6<?php } ?> <?php if (!$column_right and !$column_left) { ?>span12 <?php } ?>" id="content"><?php echo $content_top; ?>
  <h1><?php echo $heading_title; ?></h1><br />
  <?php if (!$single)	 { ?>
	<div id="filter">
		<span <?php if ($active == 'all') echo 'class="active"';?>><a href="<?php echo $showall_url;?>"><?php echo $text_rating_all; ?>(<?php echo $total;?>)</a></span>
		<span <?php if ($active == 'good') echo 'class="active"';?>><a href="<?php echo $good;?>"><?php echo $text_rating_good; ?>(<?php echo $total_good;?>)</a></span>
		<span <?php if ($active == 'bad') echo 'class="active"';?>><a href="<?php echo $bad;?>"><?php echo $text_rating_bad; ?>(<?php echo $total_bad;?>)</a></span>
	</div>
	 <?php } ?>
  <?php if (true/*$testimonials*/) { ?>
  <div class="product-list">
	<ul class="">
		<?php foreach ($testimonials as $testimonial) { ?>
		<li class="first-in-line">
		<div class="row">
		  <div class="left span9">
		  <div style="color:#2f2f2f;font-size:15px;" class="name"><?php echo $testimonial['title']; ?></div>
		  <div class="imonial"><?php echo $testimonial['description']; ?></div>
		  <div><?php echo $testimonial["date_added"];?><span style="font-weight:bold; margin-left:10px;"><br /><?php echo $testimonial["name"];?></span>
		  <div class="rating">
		  <?php if ($testimonial['rating']) { ?>
		  <img height="13" src="catalog/view/theme/kitchen/image/stars-<?php echo $testimonial['rating']; ?>.png" />
		  <?php } ?>
		  </div>
		  </div>
		  </div>
		</li>
		<?php } ?>
	 </ul>
  </div>
  <div class="pagination"><?php echo $pagination; ?></div>
  <?php } else { ?>
  <div class="content"><?php echo $text_empty; ?></div>
  <?php }?>
  <div class="buttons" align="right"><a class="button" href="<?php echo $write_url;?>" title="<?php echo $write;?>"><span><?php echo $write;?></span></a></div>
  <?php echo $content_bottom; ?></div>
  <?php echo $column_left; ?>
	</div>
</div>
<?php echo $column_right; ?>
<?php echo $footer; ?>