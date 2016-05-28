.class public Lcom/localytics/android/LocalyticsAmpActivity;
.super Landroid/support/v4/app/FragmentActivity;
.source "LocalyticsAmpActivity.java"


# instance fields
.field protected mLocalyticsSession:Lcom/localytics/android/LocalyticsAmpSession;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 11
    invoke-direct {p0}, Landroid/support/v4/app/FragmentActivity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .registers 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 18
    invoke-super {p0, p1}, Landroid/support/v4/app/FragmentActivity;->onCreate(Landroid/os/Bundle;)V

    .line 19
    new-instance v0, Lcom/localytics/android/LocalyticsAmpSession;

    invoke-direct {v0, p0}, Lcom/localytics/android/LocalyticsAmpSession;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/localytics/android/LocalyticsAmpActivity;->mLocalyticsSession:Lcom/localytics/android/LocalyticsAmpSession;

    .line 20
    iget-object v0, p0, Lcom/localytics/android/LocalyticsAmpActivity;->mLocalyticsSession:Lcom/localytics/android/LocalyticsAmpSession;

    invoke-virtual {v0}, Lcom/localytics/android/LocalyticsAmpSession;->open()V

    .line 21
    iget-object v0, p0, Lcom/localytics/android/LocalyticsAmpActivity;->mLocalyticsSession:Lcom/localytics/android/LocalyticsAmpSession;

    invoke-virtual {v0}, Lcom/localytics/android/LocalyticsAmpSession;->upload()V

    .line 22
    return-void
.end method

.method public onPause()V
    .registers 2

    .prologue
    .line 36
    iget-object v0, p0, Lcom/localytics/android/LocalyticsAmpActivity;->mLocalyticsSession:Lcom/localytics/android/LocalyticsAmpSession;

    invoke-virtual {v0}, Lcom/localytics/android/LocalyticsAmpSession;->detach()V

    .line 37
    iget-object v0, p0, Lcom/localytics/android/LocalyticsAmpActivity;->mLocalyticsSession:Lcom/localytics/android/LocalyticsAmpSession;

    invoke-virtual {v0}, Lcom/localytics/android/LocalyticsAmpSession;->close()V

    .line 38
    iget-object v0, p0, Lcom/localytics/android/LocalyticsAmpActivity;->mLocalyticsSession:Lcom/localytics/android/LocalyticsAmpSession;

    invoke-virtual {v0}, Lcom/localytics/android/LocalyticsAmpSession;->upload()V

    .line 39
    invoke-super {p0}, Landroid/support/v4/app/FragmentActivity;->onPause()V

    .line 40
    return-void
.end method

.method public onResume()V
    .registers 2

    .prologue
    .line 27
    invoke-super {p0}, Landroid/support/v4/app/FragmentActivity;->onResume()V

    .line 28
    iget-object v0, p0, Lcom/localytics/android/LocalyticsAmpActivity;->mLocalyticsSession:Lcom/localytics/android/LocalyticsAmpSession;

    invoke-virtual {v0}, Lcom/localytics/android/LocalyticsAmpSession;->open()V

    .line 29
    iget-object v0, p0, Lcom/localytics/android/LocalyticsAmpActivity;->mLocalyticsSession:Lcom/localytics/android/LocalyticsAmpSession;

    invoke-virtual {v0}, Lcom/localytics/android/LocalyticsAmpSession;->upload()V

    .line 30
    iget-object v0, p0, Lcom/localytics/android/LocalyticsAmpActivity;->mLocalyticsSession:Lcom/localytics/android/LocalyticsAmpSession;

    invoke-virtual {v0, p0}, Lcom/localytics/android/LocalyticsAmpSession;->attach(Landroid/support/v4/app/FragmentActivity;)V

    .line 31
    return-void
.end method
