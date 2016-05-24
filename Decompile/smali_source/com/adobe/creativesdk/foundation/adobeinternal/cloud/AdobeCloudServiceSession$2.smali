.class Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession$2;
.super Ljava/util/TimerTask;
.source "AdobeCloudServiceSession.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->setupOngoingConnectionTimer(JZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;

    .prologue
    .line 452
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession$2;->this$0:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;

    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .prologue
    .line 455
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession$2;->this$0:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;

    # invokes: Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->ongoingCheckServiceConnection()V
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->access$100(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;)V

    .line 456
    return-void
.end method
