<?php echo $header; ?>
<div class="<?php if ($column_right) { ?>span9<?php } else {?>span12<?php } ?>">
	<div class="row">
<div class="<?php if ($column_left or $column_right) { ?>span9<?php } ?> <?php if ($column_left and $column_right) { ?>span6<?php } ?> <?php if (!$column_right and !$column_left) { ?>span12 <?php } ?>" id="content"><?php echo $content_top; ?>
  <h1><?php echo $heading_title; ?></h1><br />
  <?php if ($reviews) { ?>
  <div class="product-list">
	<ul class="">
		<?php $i=0; foreach ($reviews as $review) { $i++; ?>
		<li class="first-in-line">
		<div class="row">
		  <?php if ($review['prod_thumb']) { ?>
		  <div class="image span2"><?php echo $review['sticker']; ?><a href="<?php echo $review['prod_href']; ?>"><img id="img_<?php echo $review['product_id']; ?>" src="<?php echo $review['prod_thumb']; ?>" title="<?php echo $review['prod_name']; ?>" alt="<?php echo $review['prod_name']; ?>" /></a></div>
		  <?php } ?>
		  <div class="left span7">
		  <div class="name"><a href="<?php echo $review['prod_href']; ?>"><?php echo $review['prod_name']; ?></a></div>
		  <div class="description"><?php echo $review['description']; ?> <a href="<?php echo $review['prod_href']; ?>">...&raquo;</a></div>
		  <div><?php echo $review["date_added"];?><span style="font-weight:bold; margin-left:10px;"><br /><?php echo $review["author"];?></span>
		  <div class="rating">
		  <?php if ($review['rating']) { ?>
		  <img height="13" src="catalog/view/theme/kitchen/image/stars-<?php echo $review['rating']; ?>.png" />
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
  <?php echo $content_bottom; ?></div>
  <?php echo $column_left; ?>
	</div>
</div>
<?php echo $column_right; ?>
<?php echo $footer; ?>