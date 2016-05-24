.class public Lcom/adobe/creativesdk/aviary/internal/events/QuickLaunchEvent;
.super Ljava/lang/Object;
.source "QuickLaunchEvent.java"


# instance fields
.field public final options:Landroid/os/Bundle;

.field public final tool:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;Landroid/os/Bundle;)V
    .registers 3
    .param p1, "tool"    # Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;
    .param p2, "options"    # Landroid/os/Bundle;

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/events/QuickLaunchEvent;->tool:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .line 16
    iput-object p2, p0, Lcom/adobe/creativesdk/aviary/internal/events/QuickLaunchEvent;->options:Landroid/os/Bundle;

    .line 17
    return-void
.end method
