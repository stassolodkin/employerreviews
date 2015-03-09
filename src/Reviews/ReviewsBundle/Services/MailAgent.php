<?php


namespace Reviews\ReviewsBundle\Services;

class MailerAgent {

	protected mail_transport;
	protected contact_email;

	public function __construct($mail_transport, $contact_email) {
		$this->mail_transport = $mail_transport;
		$this->contact_email = $contact_email;
	}
}