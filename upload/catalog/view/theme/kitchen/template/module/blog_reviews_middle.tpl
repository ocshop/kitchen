<div class="box">
   <?php if ($header) {?>
  <div class="box-heading"><?php echo $header; ?></div>
  <?php } ?>
  <div class="box-content">
    <div class="box-product">
      <?php foreach ($reviews as $review) { ?>
      <div style="margin:0 0 10px;width:100%;overflow:auto;">
		<?php if ($review['article_id']) {?>
        <?php if ($review['articl_thumb']) { ?>
        <div class="image span2" style="float:left;margin: 0 20px 0 0;"><a href="<?php echo $review['articl_href']; ?>"><img src="<?php echo $review['articl_thumb']; ?>" alt="<?php echo $review['articl_name']; ?>" title="<?php echo $review['articl_name']; ?>"/></a></div>
        <?php } ?>
        <div class="name"><a href="<?php echo $review['articl_href']; ?>"><?php echo $review['articl_name']; ?></a></div>
        <div class="description"><?php echo $review['description']?> <a href="<?php echo $review['href']?>">...&raquo;</a></div>
		<div class="added-viewed" style="margin:10px 0 5px;"><i class=" icon-time"></i> <?php echo $review["date_added"];?>&nbsp;&nbsp;&nbsp;<i class=" icon-eye-open"></i> <?php echo $text_views; ?> <?php echo $review["viewed"];?></div>
		<div class="rating">
		<?php if ($review['rating']) { ?>
		<img height="13" src="catalog/view/theme/kitchen/image/stars-<?php echo $review['rating']; ?>.png" />
		<?php } ?>
		</div>
		<div class="author" style="margin-top:5px;"><strong><?php echo $review['author']?></strong></div>
		<?}?>
        </div>
      <?php } ?>
    </div>
  </div>
</div>