<div class="box">
  <div class="box-heading"><?php echo $heading_title; ?></div>
  <div class="box-content">
    <div class="box-product">
      <?php foreach ($articles as $article) { ?>
      <div style="margin:0 0 10px;width:100%;overflow:auto;">
        <?php if ($article['thumb']) { ?>
        <div class="image span2" style="float:left;margin: 0 20px 0 0;"><a href="<?php echo $article['href']; ?>"><img src="<?php echo $article['thumb']; ?>" alt="<?php echo $article['name']; ?>" /></a></div>
        <?php } ?>
        <div class="name"><a href="<?php echo $article['href']; ?>"><?php echo $article['name']; ?></a></div>
		<div class="description"><?php echo $article['description']; ?> <a href="<?php echo $article['href']?>">...&raquo;</a></div>
		<div class="added-viewed" style="margin:10px 0 5px;"><i class=" icon-time"></i> <?php echo $article["date_added"];?>&nbsp;&nbsp;&nbsp;<i class=" icon-eye-open"></i> <?php echo $text_views; ?> <?php echo $article["viewed"];?></div>
		<div class="rating">
		<?php if ($article['rating']) { ?>
		<img height="13" src="catalog/view/theme/kitchen/image/stars-<?php echo $article['rating']; ?>.png" alt="<?php echo $article['reviews']; ?>" />
		<?php } ?>
		</div>
        </div>
      <?php } ?>
    </div>
  </div>
</div>
