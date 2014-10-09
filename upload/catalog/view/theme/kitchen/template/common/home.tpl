<?php echo $header; ?>
<div class="<?php if ($column_right) { ?>span9<?php } else {?>span12<?php } ?>">
	<div class="row">
		<div class="<?php if ($column_left or $column_right) { ?>span9<?php } ?> <?php if ($column_left and $column_right) { ?>span6<?php } ?> <?php if (!$column_right and !$column_left) { ?>span12 <?php } ?>" id="content"><?php echo $content_top; ?>
		<div class="content_bottom clearfix">
			<?php echo $content_bottom; ?>
			
		</div>
		</div>
		<?php echo $column_left; ?>
	</div>
</div>
<?php echo $column_right; ?>
<?php echo $footer; ?>