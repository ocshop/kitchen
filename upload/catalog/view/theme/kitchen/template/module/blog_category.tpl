<div class="box category">
	<div class="box-heading"><?php echo $heading_title; ?></div>
  <div class="box-content">
  
    <div class="box-category">
      <ul>
        <?php foreach ($categories as $news) { ?>
        <?php if ($news['news_id'] == $news_id) { ?>
        <li class="active cat-header <?php if ($news['children']) { ?>parent<?php } ?>">
        <?php } else { ?>
        <li class="cat-header <?php if ($news['children']) { ?>parent<?php } ?>">
        <?php } ?>
          <?php if ($news['news_id'] == $news_id) { ?>
          <a href="<?php echo $news['href']; ?>" class="active"><?php echo $news['name']; ?></a>
          <?php } else { ?>
          <a href="<?php echo $news['href']; ?>"><?php echo $news['name']; ?></a>
          <?php } ?>
          <?php if ($news['children']) { ?>

            <?php for ($i = 0; $i < count($news['children']);) { ?>
            <?php if ($news['news_id'] == $news_id) { ?>
            <ul class="active">
            <?php } else { ?>
            <ul>
            <?php }?>
              <?php $j = $i + count($news['children']); ?>
              <?php for (; $i < $j; $i++) { ?>
              <?php if (isset($news['children'][$i])) { ?>
              <?php $id=$news['children'][$i]['news_id'];?>
              <?php if ( $id == $child_id) { ?>
              <li class="active <?php if ($news['children'][$i]['children3']) {?> parent<?php } ?>">
                <?php } else { ?>
              <li class="<?php if ($news['children'][$i]['children3']) {?> parent<?php } ?>">
                <?php } ?>
                <?php if ($news['children'][$i]['children3']) {?>
                <a  href="<?php echo $news['children'][$i]['href']; ?>"><?php echo $news['children'][$i]['name'];?></a>
                <?php if ( $id == $child_id) { ?>
                <ul class="active">
               	<?php } else { ?>
                <ul>
                <?php }?>
                  <?php foreach ($news['children'][$i]['children3'] as $ch3) { ?>
                  <li>
                    <?php if ($ch3['news_id'] == $ch3_id) { ?>
                    <a href="<?php echo $ch3['href']; ?>" class="active"><?php echo $ch3['name']; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $ch3['href']; ?>"><?php echo $ch3['name']; ?></a>
                    <?php } ?>
                  </li>
                  <?php } ?>
                </ul>
                <?php } else {?>
                <a  href="<?php echo $news['children'][$i]['href']; ?>"><?php echo $news['children'][$i]['name'];?></a>
              <?php }?>
              </li>
              <?php } ?>
              <?php } ?>
            </ul>
            <?php } ?>
      <?php } ?>
        </li>
        <?php } ?>
      </ul>
    </div>
  </div>
</div>
