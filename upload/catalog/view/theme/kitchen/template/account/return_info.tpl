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
  <div class="box-container">
      <table class="list table table-bordered">
        <thead>
          <tr>
            <td class="left" colspan="2"><?php echo $text_return_detail; ?></td>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="left" style="width: 50%;"><b><?php echo $text_return_id; ?></b> #<?php echo $return_id; ?><br />
              <b><?php echo $text_date_added; ?></b> <?php echo $date_added; ?></td>
            <td class="left" style="width: 50%;"><b><?php echo $text_order_id; ?></b> #<?php echo $order_id; ?><br />
              <b><?php echo $text_date_ordered; ?></b> <?php echo $date_ordered; ?></td>
          </tr>
        </tbody>
      </table>
      <h2><?php echo $text_product; ?></h2>
      <table class="list table table-bordered">
        <thead>
          <tr>
            <td class="left" style="width: 33.3%;"><?php echo $column_product; ?></td>
            <td class="left" style="width: 33.3%;"><?php echo $column_model; ?></td>
            <td class="right" style="width: 33.3%;"><?php echo $column_quantity; ?></td>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="left"><?php echo $product; ?></td>
            <td class="left"><?php echo $model; ?></td>
            <td class="right"><?php echo $quantity; ?></td>
          </tr>
        </tbody>
      </table>
      <table class="list table table-bordered">
        <thead>
          <tr>
            <td class="left" style="width: 33.3%;"><?php echo $column_reason; ?></td>
            <td class="left" style="width: 33.3%;"><?php echo $column_opened; ?></td>
            <td class="left" style="width: 33.3%;"><?php echo $column_action; ?></td>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="left"><?php echo $reason; ?></td>
            <td class="left"><?php echo $opened; ?></td>
            <td class="left"><?php echo $action; ?></td>
          </tr>
        </tbody>
      </table>
      <?php if ($comment) { ?>
      <table class="list table table-bordered">
        <thead>
          <tr>
            <td class="left"><?php echo $text_comment; ?></td>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="left"><?php echo $comment; ?></td>
          </tr>
        </tbody>
      </table>
      <?php } ?>
      <?php if ($histories) { ?>
      <h2><?php echo $text_history; ?></h2>
      <table class="list table table-bordered">
        <thead>
          <tr>
            <td class="left" style="width: 33.3%;"><?php echo $column_date_added; ?></td>
            <td class="left" style="width: 33.3%;"><?php echo $column_status; ?></td>
            <td class="left" style="width: 33.3%;"><?php echo $column_comment; ?></td>
          </tr>
        </thead>
        <tbody>
          <?php foreach ($histories as $history) { ?>
          <tr>
            <td class="left"><?php echo $history['date_added']; ?></td>
            <td class="left"><?php echo $history['status']; ?></td>
            <td class="left"><?php echo $history['comment']; ?></td>
          </tr>
          <?php } ?>
        </tbody>
      </table>
      <?php } ?>
      <div class="buttons">
        <div class="right"><a href="<?php echo $continue; ?>" class="button-cont-right"><?php echo $button_continue; ?><i class="icon-circle-arrow-right"></i></a></div>
      </div>
  </div>
  <?php echo $content_bottom; ?></div>
      <?php echo $column_left; ?>
	</div>
</div>
<?php echo $column_right; ?>

<?php echo $footer; ?>