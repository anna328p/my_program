/*
 * =====================================================================================
 *
 *       Filename:  gui.c
 *
 *    Description:  GUI
 *
 *        Version:  1.0
 *        Created:  03/16/2020 11:51:40 PM
 *       Revision:  none
 *       Compiler:  gcc
 *
 * =====================================================================================
 */
#include <stdlib.h>
#include "gui.h"

void activate(GtkApplication* app, gpointer user_data) {

	GtkWidget *window = gtk_application_window_new(app);
	gtk_window_set_title(GTK_WINDOW(window), "My Application");
	// gtk_window_set_default_size(GTK_WINDOW(window), 300, 200);

	GtkWidget *box = gtk_box_new(GTK_ORIENTATION_VERTICAL, 8);
	gtk_container_add(GTK_CONTAINER(window), box);

	GtkWidget *label = gtk_label_new("Hello, world!");
	gtk_container_add(GTK_CONTAINER(box), label);

	GtkWidget *button_box = gtk_button_box_new(GTK_ORIENTATION_HORIZONTAL);
	gtk_container_add(GTK_CONTAINER(box), button_box);

	GtkWidget *button = gtk_button_new_with_label("OK");
	g_signal_connect_swapped(button, "clicked", G_CALLBACK(gtk_widget_destroy), window);
	gtk_container_add(GTK_CONTAINER(button_box), button);

	gtk_widget_show_all(window);
}
