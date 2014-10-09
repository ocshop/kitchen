<?php if (count($currencies) > 1) { ?>
<div id="currency" class="header-button">
	<div>
		<div class="heading-1"><i class="icon-money"></i><?php echo $text_currency; ?><i class="icon-caret-down"></i></div>
		<div class="heading">
		<?php foreach ($currencies as $currency) { ?>
			<?php if ($currency['code'] == $currency_code) { ?>
			<?php if ($currency['symbol_left']) { ?>
			<?php echo $currency['symbol_left']; ?><i class="icon-caret-down"></i>
			<?php } else { ?>
			<?php echo $currency['symbol_right']; ?><i class="icon-caret-down"></i>
			<?php } ?>
			<?php } ?>
		<?php } ?>
		</div>
	</div>
		<ul>
			<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
			<?php foreach ($currencies as $currency) { ?>
				<?php if ($currency['code'] == $currency_code) { ?>
				<?php if ($currency['symbol_left']) { ?>
				<li><a title="<?php echo $currency['title']; ?>"><span class="act"><?php echo $currency['symbol_left']; ?></span></a></li>
				<?php } else { ?>
				<li><a title="<?php echo $currency['title']; ?>"><span class="act"><?php echo $currency['symbol_right']; ?></span></a></li>
				<?php } ?>
				<?php } else { ?>
				<?php if ($currency['symbol_left']) { ?>
				<li><a title="<?php echo $currency['title']; ?>" onClick="$('input[name=\'currency_code\']').attr('value', '<?php echo $currency['code']; ?>').submit(); $(this).parent().parent().submit();"><span><?php echo $currency['symbol_left']; ?></span></a></li>
				<?php } else { ?>
				<li><a title="<?php echo $currency['title']; ?>" onClick="$('input[name=\'currency_code\']').attr('value', '<?php echo $currency['code']; ?>').submit(); $(this).parent().parent().submit();"><span><?php echo $currency['symbol_right']; ?></span></a></li>
				<?php } ?>
				<?php } ?>
			<?php } ?>
			<input type="hidden" name="currency_code" value="" />
			<input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
			</form>
		</ul>
			
	</div>

<?php } ?>
