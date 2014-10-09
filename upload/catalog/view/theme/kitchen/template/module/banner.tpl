<div id="banner<?php echo $module; ?>" class="banner clearfix">
  <?php foreach ($banners as $banner) { ?>
  <?php if ($banner['link']) { ?>
  <div class="<?php echo $banner['title']; ?>"><a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" /><div class="s-desc"><?php echo $banner['description']; ?></div></a></div>
  <?php } else { ?>
  <div class="<?php echo $banner['title']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" /><div class="s-desc"><?php echo $banner['description']; ?></div></div>
  <?php } ?>
  <?php } ?>
  <span class="clear"></span>
</div>
