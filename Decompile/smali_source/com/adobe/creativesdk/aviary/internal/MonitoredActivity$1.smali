.class Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity$1;
.super Ljava/lang/Object;
.source "MonitoredActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;->lazyInitialize()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;

    .prologue
    .line 152
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .prologue
    .line 155
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;

    # invokes: Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;->initializeBroadcastReceivers()V
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;->access$000(Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;)V

    .line 156
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;

    # invokes: Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;->initializeCDS()V
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;->access$100(Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;)V

    .line 157
    return-void
.end method
