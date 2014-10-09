<div class="box category">
	<div class="box-heading"><?php echo $heading_title; ?></div>
  <div class="box-content">
  
    <div class="box-category">
      <ul>
        <?php foreach ($categories as $category) { ?>
        <?php if ($category['category_id'] == $category_id) { ?>
        <li class="active cat-header <?php if ($category['children']) { ?>parent<?php } ?>">
        <?php } else { ?>
        <li class="cat-header <?php if ($category['children']) { ?>parent<?php } ?>">
        <?php } ?>
          <?php if ($category['category_id'] == $category_id) { ?>
          <a href="<?php echo $category['href']; ?>" class="active"><?php echo $category['name']; ?></a>
          <?php } else { ?>
          <a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
          <?php } ?>
          <?php if ($category['children']) { ?>

            <?php for ($i = 0; $i < count($category['children']);) { ?>
            <?php if ($category['category_id'] == $category_id) { ?>
            <ul class="active">
            <?php } else { ?>
            <ul>
            <?php }?>
              <?php $j = $i + count($category['children']); ?>
              <?php for (; $i < $j; $i++) { ?>
              <?php if (isset($category['children'][$i])) { ?>
              <?php $id=$category['children'][$i]['category_id'];?>
              <?php if ( $id == $child_id) { ?>
              <li class="active <?php if ($category['children'][$i]['children3']) {?> parent<?php } ?>">
                <?php } else { ?>
              <li class="<?php if ($category['children'][$i]['children3']) {?> parent<?php } ?>">
                <?php } ?>
                <?php if ($category['children'][$i]['children3']) {?>
                <a  href="<?php echo $category['children'][$i]['href']; ?>"><?php echo $category['children'][$i]['name'];?></a>
                <?php if ( $id == $child_id) { ?>
                <ul class="active">
               	<?php } else { ?>
                <ul>
                <?php }?>
                  <?php foreach ($category['children'][$i]['children3'] as $ch3) { ?>
                  <li>
                    <?php if ($ch3['category_id'] == $ch3_id) { ?>
                    <a href="<?php echo $ch3['href']; ?>" class="active"><?php echo $ch3['name']; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $ch3['href']; ?>"><?php echo $ch3['name']; ?></a>
                    <?php } ?>
                  </li>
                  <?php } ?>
                </ul>
                <?php } else {?>
                <a  href="<?php echo $category['children'][$i]['href']; ?>"><?php echo $category['children'][$i]['name'];?></a>
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
