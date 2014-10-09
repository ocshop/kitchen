<?php
if ($borderless) {
     echo $code;
} else { ?>
<div class="box <?php echo $classname; ?>">
  <div class="heading">
	<?php if($title) { echo $title; } else { echo "&nbsp;"; } ?>
  </div>
    <div class="content">
    <?php echo $code; ?>
  </div>
</div>
<?php }; ?>