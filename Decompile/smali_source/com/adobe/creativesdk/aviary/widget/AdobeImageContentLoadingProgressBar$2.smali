.class Lcom/adobe/creativesdk/aviary/widget/AdobeImageContentLoadingProgressBar$2;
.super Ljava/lang/Object;
.source "AdobeImageContentLoadingProgressBar.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/widget/AdobeImageContentLoadingProgressBar;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageContentLoadingProgressBar;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/widget/AdobeImageContentLoadingProgressBar;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/widget/AdobeImageContentLoadingProgressBar;

    .prologue
    .line 26
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageContentLoadingProgressBar$2;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageContentLoadingProgressBar;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 5

    .prologue
    .line 29
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageContentLoadingProgressBar$2;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageContentLoadingProgressBar;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/AdobeImageContentLoadingProgressBar;->mDismissed:Z
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageContentLoadingProgressBar;->access$100(Lcom/adobe/creativesdk/aviary/widget/AdobeImageContentLoadingProgressBar;)Z

    move-result v0

    if-nez v0, :cond_17

    .line 30
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageContentLoadingProgressBar$2;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageContentLoadingProgressBar;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    # setter for: Lcom/adobe/creativesdk/aviary/widget/AdobeImageContentLoadingProgressBar;->mStartTime:J
    invoke-static {v0, v2, v3}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageContentLoadingProgressBar;->access$002(Lcom/adobe/creativesdk/aviary/widget/AdobeImageContentLoadingProgressBar;J)J

    .line 31
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageContentLoadingProgressBar$2;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageContentLoadingProgressBar;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageContentLoadingProgressBar;->setVisibility(I)V

    .line 33
    :cond_17
    return-void
.end method
