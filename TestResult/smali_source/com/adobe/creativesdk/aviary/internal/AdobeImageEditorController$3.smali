.class Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController$3;
.super Ljava/lang/Object;
.source "AdobeImageEditorController.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->setCurrentState(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    .prologue
    .line 845
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController$3;->this$0:Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .prologue
    .line 848
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController$3;->this$0:Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mContext:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->access$100(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;)Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->getDrawingImageContainer()Landroid/view/ViewGroup;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 850
    return-void
.end method
