.class Lcom/adobe/creativesdk/aviary/panels/BlemishPanel$GenerateResultTask;
.super Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask;
.source "BlemishPanel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;
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
        "Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;",
        ">;"
    }
.end annotation


# instance fields
.field mProgress:Landroid/app/ProgressDialog;

.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;)V
    .registers 4
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;

    .prologue
    .line 460
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel$GenerateResultTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;

    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask;-><init>()V

    .line 461
    new-instance v0, Landroid/app/ProgressDialog;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel$GenerateResultTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getBaseContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel$GenerateResultTask;->mProgress:Landroid/app/ProgressDialog;

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Void;)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;
    .registers 7
    .param p1, "params"    # [Ljava/lang/Void;

    .prologue
    .line 475
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionFactory;->actionList()Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    move-result-object v0

    .line 477
    .local v0, "actions":Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel$GenerateResultTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;

    # getter for: Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mBackgroundDrawThread:Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->access$000(Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;)Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;

    move-result-object v2

    if-eqz v2, :cond_4f

    .line 479
    :goto_c
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel$GenerateResultTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;

    # getter for: Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mBackgroundDrawThread:Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->access$000(Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;)Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;

    move-result-object v2

    if-eqz v2, :cond_4f

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel$GenerateResultTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;

    # getter for: Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mBackgroundDrawThread:Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->access$000(Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;)Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;

    move-result-object v2

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->isCompleted()Z

    move-result v2

    if-nez v2, :cond_4f

    .line 480
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel$GenerateResultTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;

    iget-object v2, v2, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "waiting.... "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel$GenerateResultTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;

    # getter for: Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mBackgroundDrawThread:Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;
    invoke-static {v4}, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->access$000(Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;)Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;

    move-result-object v4

    invoke-virtual {v4}, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->getQueueSize()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 482
    const-wide/16 v2, 0x32

    :try_start_46
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_49
    .catch Ljava/lang/InterruptedException; {:try_start_46 .. :try_end_49} :catch_4a

    goto :goto_c

    .line 483
    :catch_4a
    move-exception v1

    .line 484
    .local v1, "e":Ljava/lang/InterruptedException;
    invoke-virtual {v1}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_c

    .line 489
    .end local v1    # "e":Ljava/lang/InterruptedException;
    :cond_4f
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel$GenerateResultTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;

    # getter for: Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mFilter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->access$100(Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;)Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;

    move-result-object v2

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;->getActions()Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->get(I)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->add(Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;)Z

    .line 490
    return-object v0
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 460
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel$GenerateResultTask;->doInBackground([Ljava/lang/Void;)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    move-result-object v0

    return-object v0
.end method

.method protected doPostExecute(Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;)V
    .registers 4
    .param p1, "result"    # Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    .prologue
    .line 496
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel$GenerateResultTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getBaseActivity()Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_11

    .line 507
    :goto_10
    return-void

    .line 500
    :cond_11
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel$GenerateResultTask;->mProgress:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_1e

    .line 502
    :try_start_19
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel$GenerateResultTask;->mProgress:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V
    :try_end_1e
    .catch Ljava/lang/IllegalArgumentException; {:try_start_19 .. :try_end_1e} :catch_28

    .line 506
    :cond_1e
    :goto_1e
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel$GenerateResultTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel$GenerateResultTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;

    iget-object v1, v1, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mPreview:Landroid/graphics/Bitmap;

    # invokes: Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->onComplete(Landroid/graphics/Bitmap;Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;)V
    invoke-static {v0, v1, p1}, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->access$200(Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;Landroid/graphics/Bitmap;Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;)V

    goto :goto_10

    .line 503
    :catch_28
    move-exception v0

    goto :goto_1e
.end method

.method protected bridge synthetic doPostExecute(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 460
    check-cast p1, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel$GenerateResultTask;->doPostExecute(Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;)V

    return-void
.end method

.method protected doPreExecute()V
    .registers 4

    .prologue
    .line 465
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel$GenerateResultTask;->mProgress:Landroid/app/ProgressDialog;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel$GenerateResultTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getBaseContext()Landroid/content/Context;

    move-result-object v1

    sget v2, Lcom/aviary/android/feather/sdk/R$string;->feather_loading_title:I

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 466
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel$GenerateResultTask;->mProgress:Landroid/app/ProgressDialog;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel$GenerateResultTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getBaseContext()Landroid/content/Context;

    move-result-object v1

    sget v2, Lcom/aviary/android/feather/sdk/R$string;->feather_effect_loading_message:I

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 467
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel$GenerateResultTask;->mProgress:Landroid/app/ProgressDialog;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setIndeterminate(Z)V

    .line 468
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel$GenerateResultTask;->mProgress:Landroid/app/ProgressDialog;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    .line 469
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel$GenerateResultTask;->mProgress:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->show()V

    .line 470
    return-void
.end method
