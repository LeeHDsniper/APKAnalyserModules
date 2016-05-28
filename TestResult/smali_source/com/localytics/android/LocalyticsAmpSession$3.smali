.class Lcom/localytics/android/LocalyticsAmpSession$3;
.super Landroid/os/AsyncTask;
.source "LocalyticsAmpSession.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/localytics/android/LocalyticsAmpSession;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/localytics/android/LocalyticsAmpSession;

.field final synthetic val$apiKey:Ljava/lang/String;

.field final synthetic val$campaign:Ljava/lang/String;

.field final synthetic val$creative:Ljava/lang/String;

.field final synthetic val$provider:Lcom/localytics/android/LocalyticsProvider;


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # [Ljava/lang/Object;

    .prologue
    .line 418
    check-cast p1, [Ljava/lang/Void;

    .end local p1    # "x0":[Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/localytics/android/LocalyticsAmpSession$3;->doInBackground([Ljava/lang/Void;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Void;
    .registers 4
    .param p1, "params"    # [Ljava/lang/Void;

    .prologue
    .line 428
    iget-object v0, p0, Lcom/localytics/android/LocalyticsAmpSession$3;->val$provider:Lcom/localytics/android/LocalyticsProvider;

    new-instance v1, Lcom/localytics/android/LocalyticsAmpSession$3$1;

    invoke-direct {v1, p0}, Lcom/localytics/android/LocalyticsAmpSession$3$1;-><init>(Lcom/localytics/android/LocalyticsAmpSession$3;)V

    invoke-virtual {v0, v1}, Lcom/localytics/android/LocalyticsProvider;->runBatchTransaction(Ljava/lang/Runnable;)V

    .line 477
    const/4 v0, 0x0

    return-object v0
.end method

.method protected onPreExecute()V
    .registers 4

    .prologue
    .line 422
    iget-object v0, p0, Lcom/localytics/android/LocalyticsAmpSession$3;->this$0:Lcom/localytics/android/LocalyticsAmpSession;

    iget-object v0, v0, Lcom/localytics/android/LocalyticsAmpSession;->mContext:Landroid/content/Context;

    const-string v1, "Push Test Activated\nYou should receive a notification soon."

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 423
    return-void
.end method
