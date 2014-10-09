<div class="clear"></div>
</div>
</div>
</div>
<div class="clear"></div>
</section>
<footer>
	<div class="container">
	
	
		<div class="row">
<div id="custom-footer">
<div class="footer-logo"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></div>
<div class="column-welcome">
	<ul>
		<li><?php echo $welcome; ?></li>
	</ul>
</div>
<div class="column-contacts">
	<ul>
		<li><li><i class="icon-phone"></i> <?php echo $telephone; ?></li>
		<?php if ($fax) { ?><li><i class="icon-phone"></i> <?php echo $fax; ?></li><?php } ?>
		<li><i class=" icon-envelope-alt"></i> <?php echo $email; ?></li>
		<li class="footer-address"><i class="icon-map-marker "></i> <?php echo $address; ?></li>
		<li class="footer-time"><i class=" icon-time icon-large"></i> </li>
		<li> <?php echo $time; ?></li>
		<li><i class="fa fa-share"></i> <a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
	</ul>
</div>
<div class="column-maps">
	<ul>
		<li><?php echo $maps; ?></li>
	</ul>
</div>
</div>
</div>

	
		<div class="row">
			<?php if ($informations) { ?>
			<div class="span3">
				<h3><?php echo $text_information; ?></h3>
				<ul>
				<?php foreach ($informations as $information) { ?>
				<li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
				<?php } ?>
				</ul>
			</div>
			<?php } ?>
			<div class="span3">
				<h3><?php echo $text_service; ?></h3>
				<ul>
				
				<li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
				<li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
				<li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
				</ul>
			</div>
			<div class="span3">
				<h3><?php echo $text_extra; ?></h3>
				<ul>
				<li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
				<li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
				<li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
				<li><a href="<?php echo $latest; ?>"><?php echo $text_latest; ?></a></li>
				</ul>
			</div>
			<div class="span3">
				<h3><?php echo $text_account; ?></h3>
				<ul>
				<li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
				<li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
				<li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
				<li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
				</ul>
			</div>
		</div>
		
	</div>
	<div id="powered">
		<div class="container">
			<div class="row">
				<div class="span12">
					<?php echo $powered; ?><!-- [[%FOOTER_LINK]] -->
				
				
				<div id="social">
	   <a target="_blank" href="<?php echo $vk; ?>"><i class=" icon-vk"></i></a>
	   <a target="_blank" href="<?php echo $fb; ?>"><i class=" icon-facebook"></i></a>
	   <a target="_blank" href="<?php echo $googleplus; ?>"><i class=" icon-google-plus"></i></a>
	   <a target="_blank" href="<?php echo $youtube; ?>"><i class=" icon-youtube"></i></a>
	   <a target="_blank" href="<?php echo $twitter; ?>"><i class=" icon-twitter"></i></a>
		</div>
		</div>
				
			</div>
		</div>
	</div>
</footer>
<script type="text/javascript" 	src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/js/livesearch.js"></script>
</div>
</div>
</div>
</body></html>