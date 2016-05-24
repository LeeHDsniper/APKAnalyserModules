.class Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$4;
.super Ljava/lang/Object;
.source "AdobeImageEditorActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->onEventMainThread(Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

.field final synthetic val$entry:Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;

.field final synthetic val$finalPoint:Landroid/graphics/Point;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;Landroid/graphics/Point;)V
    .registers 4
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    .prologue
    .line 1210
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$4;->this$0:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    iput-object p2, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$4;->val$entry:Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;

    iput-object p3, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$4;->val$finalPoint:Landroid/graphics/Point;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 5

    .prologue
    .line 1213
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$4;->this$0:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mMainController:Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$4;->val$entry:Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$4;->val$finalPoint:Landroid/graphics/Point;

    invoke-virtual {v0, v1, v2, v3}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->activateTool(Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;Landroid/os/Bundle;Landroid/graphics/Point;)V

    .line 1214
    return-void
.end method
