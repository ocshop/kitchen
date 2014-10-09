<?php echo $header; ?>
<div class="<?php if ($column_right) { ?>span9<?php } else {?>span12<?php } ?>">
	<div class="row">
<div class="<?php if ($column_left or $column_right) { ?>span9<?php } ?> <?php if ($column_left and $column_right) { ?>span6<?php } ?> <?php if (!$column_right and !$column_left) { ?>span12 <?php } ?>" id="content"><?php echo $content_top; ?>
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <h1 class="style-1"><?php echo $heading_title; ?></h1>
  <?php if ($returns) { ?>
    <div class="box-container">
    <div class="count-item">
    <?php foreach ($returns as $return) { ?>
    <div class="return-list">
      <div class="heading-order-list">
      <div class="return-id"><b><?php echo $text_return_id; ?></b> <span>#<?php echo $return['return_id']; ?></span></div>
      <div class="return-status"><b><?php echo $text_status; ?></b> <span><?php echo $return['status']; ?></span></div>
      </div>
      <div class="return-content">
        <div><b><?php echo $text_date_added; ?></b> <span><?php echo $return['date_added']; ?></span><br />
          <b><?php echo $text_order_id; ?></b> <strong><?php echo $return['order_id']; ?></strong></div>
        <div><b><?php echo $text_customer; ?></b> <span><?php echo $return['name']; ?></span></div>
        <div class="return-info"><a class="button" href="<?php echo $return['href']; ?>"><span><?php echo $button_view; ?></span></a></div>
      </div>
    </div>
    <?php } ?>
    </div>
    <div class="buttons">
      <div class="right"><a href="<?php echo $continue; ?>" class="button-cont-right"><?php echo $button_continue; ?><i class="icon-circle-arrow-right"></i></a></div>
    </div>
    </div>
  <div class="pagination"><?php echo $pagination; ?></div>
  <?php } else { ?>
  <div class="box-container">
    <div class="content"><?php echo $text_empty; ?></div>
    <div class="buttons">
      <div class="right"><a href="<?php echo $continue; ?>" class="button-cont-right"><?php echo $button_continue; ?><i class="icon-circle-arrow-right"></i></a></div>
    </div>
  </div>
  <?php } ?>
  
  <?php echo $content_bottom; ?></div>
  <?php echo $column_left; ?>
	</div>
</div>
<?php echo $column_right; ?>

<?php echo $footer; ?>