.class Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$5;
.super Ljava/lang/Object;
.source "AdobeImageEditorActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->onEvent(Lcom/adobe/creativesdk/aviary/internal/events/MessageUserActionEvent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

.field final synthetic val$options:Landroid/os/Bundle;

.field final synthetic val$tool:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;Landroid/os/Bundle;)V
    .registers 4
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    .prologue
    .line 1386
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$5;->this$0:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    iput-object p2, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$5;->val$tool:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    iput-object p3, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$5;->val$options:Landroid/os/Bundle;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 5

    .prologue
    .line 1389
    invoke-static {}, Lcom/adobe/creativesdk/aviary/utils/EventBusUtils;->getInstance()Lde/greenrobot/event/EventBus;

    move-result-object v0

    new-instance v1, Lcom/adobe/creativesdk/aviary/internal/events/QuickLaunchEvent;

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$5;->val$tool:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$5;->val$options:Landroid/os/Bundle;

    invoke-direct {v1, v2, v3}, Lcom/adobe/creativesdk/aviary/internal/events/QuickLaunchEvent;-><init>(Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;Landroid/os/Bundle;)V

    invoke-virtual {v0, v1}, Lde/greenrobot/event/EventBus;->post(Ljava/lang/Object;)V

    .line 1390
    return-void
.end method
