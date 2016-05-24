.class Lcom/adobe/creativesdk/aviary/widget/AdobeImageContentLoadingProgressBar$1;
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
    .line 19
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageContentLoadingProgressBar$1;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageContentLoadingProgressBar;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 5

    .prologue
    .line 22
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageContentLoadingProgressBar$1;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageContentLoadingProgressBar;

    const-wide/16 v2, -0x1

    # setter for: Lcom/adobe/creativesdk/aviary/widget/AdobeImageContentLoadingProgressBar;->mStartTime:J
    invoke-static {v0, v2, v3}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageContentLoadingProgressBar;->access$002(Lcom/adobe/creativesdk/aviary/widget/AdobeImageContentLoadingProgressBar;J)J

    .line 23
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageContentLoadingProgressBar$1;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageContentLoadingProgressBar;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageContentLoadingProgressBar;->setVisibility(I)V

    .line 24
    return-void
.end method
