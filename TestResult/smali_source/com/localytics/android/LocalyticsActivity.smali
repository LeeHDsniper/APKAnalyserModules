.class public Lcom/localytics/android/LocalyticsActivity;
.super Landroid/app/Activity;
.source "LocalyticsActivity.java"


# instance fields
.field protected mLocalyticsSession:Lcom/localytics/android/LocalyticsSession;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 11
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .registers 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 18
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 19
    new-instance v0, Lcom/localytics/android/LocalyticsSession;

    invoke-direct {v0, p0}, Lcom/localytics/android/LocalyticsSession;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/localytics/android/LocalyticsActivity;->mLocalyticsSession:Lcom/localytics/android/LocalyticsSession;

    .line 20
    iget-object v0, p0, Lcom/localytics/android/LocalyticsActivity;->mLocalyticsSession:Lcom/localytics/android/LocalyticsSession;

    invoke-virtual {v0}, Lcom/localytics/android/LocalyticsSession;->open()V

    .line 21
    iget-object v0, p0, Lcom/localytics/android/LocalyticsActivity;->mLocalyticsSession:Lcom/localytics/android/LocalyticsSession;

    invoke-virtual {v0}, Lcom/localytics/android/LocalyticsSession;->upload()V

    .line 22
    return-void
.end method

.method public onPause()V
    .registers 2

    .prologue
    .line 35
    iget-object v0, p0, Lcom/localytics/android/LocalyticsActivity;->mLocalyticsSession:Lcom/localytics/android/LocalyticsSession;

    invoke-virtual {v0}, Lcom/localytics/android/LocalyticsSession;->close()V

    .line 36
    iget-object v0, p0, Lcom/localytics/android/LocalyticsActivity;->mLocalyticsSession:Lcom/localytics/android/LocalyticsSession;

    invoke-virtual {v0}, Lcom/localytics/android/LocalyticsSession;->upload()V

    .line 37
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 38
    return-void
.end method

.method public onResume()V
    .registers 2

    .prologue
    .line 27
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 28
    iget-object v0, p0, Lcom/localytics/android/LocalyticsActivity;->mLocalyticsSession:Lcom/localytics/android/LocalyticsSession;

    invoke-virtual {v0}, Lcom/localytics/android/LocalyticsSession;->open()V

    .line 29
    iget-object v0, p0, Lcom/localytics/android/LocalyticsActivity;->mLocalyticsSession:Lcom/localytics/android/LocalyticsSession;

    invoke-virtual {v0}, Lcom/localytics/android/LocalyticsSession;->upload()V

    .line 30
    return-void
.end method
