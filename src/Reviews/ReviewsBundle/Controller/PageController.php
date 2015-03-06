<?php

namespace Reviews\ReviewsBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Reviews\ReviewsBundle\Form\Type\ContactType;

class PageController extends Controller {
	public function indexAction() {
		return $this->render('ReviewsReviewsBundle:Page:index.html.twig');
	}

	public function aboutAction() {
		return $this->render('ReviewsReviewsBundle:Page:about.html.twig');
	}

	public function topTenAction() {
		return $this->render('ReviewsReviewsBundle:Page:top_ten.html.twig');
	}

	public function employerSearchAction() {
		return $this->render('ReviewsReviewsBundle:Page:index.html.twig');
	}

	public function employerSearchResultsAction() {
		return $this->render('ReviewsReviewsBundle:Page:employer_search_results.html.twig');
	}

	public function contactAction(Request $request) {

		$contact = new ContactType();

		$form = $this->createFormBuilder($contact)
				->add('name', 'text', array('label' => 'Name:'))
				->add('email', 'text', array('label' => 'Email:'))
				->add('subject', 'text', array('label' => 'Subject:'))
				->add('message', 'textarea', array('label' => 'Message:'))
				->add('submit', 'submit', array('label' => 'Submit'))
				->getForm();

		$form->handleRequest($request);

		if ($form->isValid()) {

			$mailer = $this->get('mailer');

			$message = $mailer->createMessage()
				->setSubject($form->get('subject')->getData())
				->setFrom($form->get('email')->getData())
				->setTo($this->container->getParameter('contact_email'))
				->setBody(
					$this->renderView(
						'ReviewsReviewsBundle:Page:contact_form_message.html.twig',
						array(
							'ip' => $request->getClientIp(),
							'name' => $form->get('name')->getData(),
							'message' => $form->get('message')->getData()
						),
						 'text/html'
					)
				);

			$mailer->send($message);

			$request->getSession()->getFlashBag()->add('success', 'Your email has been sent! Thanks!');

			// perform some action, such as saving the task to the database

			return $this->redirect($this->generateUrl('ReviewsReviewsBundle_email_sent'));
		}

		return $this->render('ReviewsReviewsBundle:Page:contact.html.twig', array(
			'form' => $form->createView(),
		));
	}

	public function emailSentAction() {
		return $this->render('ReviewsReviewsBundle:Page:email_sent.html.twig');
	}
}