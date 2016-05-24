.class Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$1;
.super Ljava/lang/Object;
.source "AdobeImageEditorActivity.java"

# interfaces
.implements Lrx/functions/Action1;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->onControllerLoaded(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lrx/functions/Action1",
        "<",
        "Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    .prologue
    .line 558
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$1;->this$0:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;)V
    .registers 5
    .param p1, "service"    # Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;

    .prologue
    .line 562
    sget-object v0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "connected!"

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 563
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$1;->this$0:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    # invokes: Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->onServiceConnected(Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;)V
    invoke-static {v0, p1}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->access$000(Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;)V

    .line 564
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 558
    check-cast p1, Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$1;->call(Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;)V

    return-void
.end method
