<?php echo $header; ?>
<?php if ($success) { ?>
<div class="success"><?php echo $success; ?></div>
<?php } ?>
<?php if ($error_warning) { ?>
  <div class="span12">
    <div class="warning"><?php echo $error_warning; ?></div>
  </div>
<?php } ?>
<div class="<?php if ($column_right) { ?>span9<?php } else {?>span12<?php } ?>">
	<div class="row">
<div  class="<?php if ($column_left or $column_right) { ?>span9<?php } ?> <?php if ($column_left and $column_right) { ?>span6<?php } ?> <?php if (!$column_right and !$column_left) { ?>span12 <?php } ?>" id="content"><?php echo $content_top; ?>
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <h1><?php echo $heading_title; ?></h1>
  <div class="box-container">
    <h2><?php echo $text_address_book; ?></h2>
    <?php foreach ($addresses as $result) { ?>
    <div class="content">
      <br />
      <br />
      <div><?php echo $result['address']; ?></div>
      
      <br />
      <div><a href="<?php echo $result['update']; ?>" class="button"><span><?php echo $button_edit; ?></a></span> &nbsp; <a href="<?php echo $result['delete']; ?>" class="button"><span><?php echo $button_delete; ?></span></a></div>
      
      <br />
    </div>
    <?php } ?>
    <div class="buttons">
      <div class="left"><a href="<?php echo $back; ?>" class="button-back-left"><i class="icon-reply"></i><?php echo $button_back; ?></a></div>
      <div class="right"><a href="<?php echo $insert; ?>" class="button-cont-right"><?php echo $button_new_address; ?><i class="icon-circle-arrow-right"></i></a></div>
    </div>
    </div>
  <?php echo $content_bottom; ?></div>
    <?php echo $column_left; ?>
	</div>
</div>
<?php echo $column_right; ?>
    
<?php echo $footer; ?>