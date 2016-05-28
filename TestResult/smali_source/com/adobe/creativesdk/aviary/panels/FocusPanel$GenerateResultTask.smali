.class Lcom/adobe/creativesdk/aviary/panels/FocusPanel$GenerateResultTask;
.super Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask;
.source "FocusPanel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/panels/FocusPanel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "GenerateResultTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field mProgress:Landroid/app/ProgressDialog;

.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/panels/FocusPanel;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/panels/FocusPanel;)V
    .registers 4
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/panels/FocusPanel;

    .prologue
    .line 500
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$GenerateResultTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/FocusPanel;

    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask;-><init>()V

    .line 502
    new-instance v0, Landroid/app/ProgressDialog;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$GenerateResultTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/FocusPanel;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getBaseContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$GenerateResultTask;->mProgress:Landroid/app/ProgressDialog;

    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 500
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$GenerateResultTask;->doInBackground([Ljava/lang/Void;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Void;
    .registers 6
    .param p1, "params"    # [Ljava/lang/Void;

    .prologue
    .line 516
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$GenerateResultTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/FocusPanel;

    # getter for: Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->mBackgroundDrawThread:Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->access$400(Lcom/adobe/creativesdk/aviary/panels/FocusPanel;)Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;

    move-result-object v1

    if-eqz v1, :cond_4b

    .line 518
    :goto_8
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$GenerateResultTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/FocusPanel;

    # getter for: Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->mBackgroundDrawThread:Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->access$400(Lcom/adobe/creativesdk/aviary/panels/FocusPanel;)Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;

    move-result-object v1

    if-eqz v1, :cond_4b

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$GenerateResultTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/FocusPanel;

    # getter for: Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->mBackgroundDrawThread:Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->access$400(Lcom/adobe/creativesdk/aviary/panels/FocusPanel;)Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;->isCompleted()Z

    move-result v1

    if-nez v1, :cond_4b

    .line 519
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$GenerateResultTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/FocusPanel;

    iget-object v1, v1, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "waiting.... "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$GenerateResultTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/FocusPanel;

    # getter for: Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->mBackgroundDrawThread:Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;
    invoke-static {v3}, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->access$400(Lcom/adobe/creativesdk/aviary/panels/FocusPanel;)Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;

    move-result-object v3

    invoke-virtual {v3}, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;->getQueueSize()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 521
    const-wide/16 v2, 0x32

    :try_start_42
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_45
    .catch Ljava/lang/InterruptedException; {:try_start_42 .. :try_end_45} :catch_46

    goto :goto_8

    .line 522
    :catch_46
    move-exception v0

    .line 523
    .local v0, "e":Ljava/lang/InterruptedException;
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_8

    .line 527
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :cond_4b
    const/4 v1, 0x0

    return-object v1
.end method

.method protected bridge synthetic doPostExecute(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 500
    check-cast p1, Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$GenerateResultTask;->doPostExecute(Ljava/lang/Void;)V

    return-void
.end method

.method protected doPostExecute(Ljava/lang/Void;)V
    .registers 5
    .param p1, "result"    # Ljava/lang/Void;

    .prologue
    .line 532
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$GenerateResultTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/FocusPanel;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getBaseActivity()Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_11

    .line 544
    :goto_10
    return-void

    .line 536
    :cond_11
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$GenerateResultTask;->mProgress:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_1e

    .line 538
    :try_start_19
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$GenerateResultTask;->mProgress:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V
    :try_end_1e
    .catch Ljava/lang/IllegalArgumentException; {:try_start_19 .. :try_end_1e} :catch_32

    .line 543
    :cond_1e
    :goto_1e
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$GenerateResultTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/FocusPanel;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$GenerateResultTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/FocusPanel;

    iget-object v1, v1, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->mPreview:Landroid/graphics/Bitmap;

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$GenerateResultTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/FocusPanel;

    # getter for: Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->mFilter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->access$200(Lcom/adobe/creativesdk/aviary/panels/FocusPanel;)Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;

    move-result-object v2

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;->getActions()Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->onComplete(Landroid/graphics/Bitmap;Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;)V

    goto :goto_10

    .line 539
    :catch_32
    move-exception v0

    goto :goto_1e
.end method

.method protected doPreExecute()V
    .registers 4

    .prologue
    .line 506
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$GenerateResultTask;->mProgress:Landroid/app/ProgressDialog;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$GenerateResultTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/FocusPanel;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getBaseContext()Landroid/content/Context;

    move-result-object v1

    sget v2, Lcom/aviary/android/feather/sdk/R$string;->feather_loading_title:I

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 507
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$GenerateResultTask;->mProgress:Landroid/app/ProgressDialog;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$GenerateResultTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/FocusPanel;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getBaseContext()Landroid/content/Context;

    move-result-object v1

    sget v2, Lcom/aviary/android/feather/sdk/R$string;->feather_effect_loading_message:I

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 508
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$GenerateResultTask;->mProgress:Landroid/app/ProgressDialog;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setIndeterminate(Z)V

    .line 509
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$GenerateResultTask;->mProgress:Landroid/app/ProgressDialog;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    .line 510
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$GenerateResultTask;->mProgress:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->show()V

    .line 511
    return-void
.end method
