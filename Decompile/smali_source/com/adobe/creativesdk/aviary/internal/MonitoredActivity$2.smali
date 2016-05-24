.class Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity$2;
.super Ljava/lang/Object;
.source "MonitoredActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;->onKill()V
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
    .line 175
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity$2;->this$0:Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 4
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 178
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 179
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity$2;->this$0:Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;->finish()V

    .line 180
    return-void
.end method
