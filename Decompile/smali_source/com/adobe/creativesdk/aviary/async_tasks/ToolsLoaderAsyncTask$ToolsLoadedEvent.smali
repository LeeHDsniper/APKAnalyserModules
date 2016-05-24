.class public final Lcom/adobe/creativesdk/aviary/async_tasks/ToolsLoaderAsyncTask$ToolsLoadedEvent;
.super Ljava/lang/Object;
.source "ToolsLoaderAsyncTask.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/async_tasks/ToolsLoaderAsyncTask;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "ToolsLoadedEvent"
.end annotation


# instance fields
.field public final entries:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;",
            ">;"
        }
    .end annotation
.end field

.field public final labels:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final whiteLabel:Z


# direct methods
.method public constructor <init>(Ljava/util/List;Ljava/util/List;Z)V
    .registers 4
    .param p3, "whiteLabel"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List",
            "<",
            "Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;",
            ">;Z)V"
        }
    .end annotation

    .prologue
    .line 35
    .local p1, "labels":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local p2, "entries":Ljava/util/List;, "Ljava/util/List<Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/async_tasks/ToolsLoaderAsyncTask$ToolsLoadedEvent;->labels:Ljava/util/List;

    .line 37
    iput-object p2, p0, Lcom/adobe/creativesdk/aviary/async_tasks/ToolsLoaderAsyncTask$ToolsLoadedEvent;->entries:Ljava/util/List;

    .line 38
    iput-boolean p3, p0, Lcom/adobe/creativesdk/aviary/async_tasks/ToolsLoaderAsyncTask$ToolsLoadedEvent;->whiteLabel:Z

    .line 39
    return-void
.end method
