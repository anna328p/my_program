/*
 * =====================================================================================
 *
 *       Filename:  my_program.c
 *
 *    Description:  My program
 *
 *        Version:  1.0
 *        Created:  03/16/2020 11:17:57 PM
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  Dmitry Kudriavtsev (dkudriavtsev@gmail.com)
 *
 * =====================================================================================
 */
#include <stdlib.h>
#include <stdio.h>

#include "gui.h"

int main(int argc, char **argv) {
	GtkApplication *app;
	int status;

	app = gtk_application_new ("org.gtk.example", G_APPLICATION_FLAGS_NONE);
	g_signal_connect(app, "activate", G_CALLBACK(activate), NULL);
	status = g_application_run (G_APPLICATION(app), argc, argv);
	g_object_unref(app);

	return status;
}
