.class Lcom/adobe/creativesdk/aviary/async_tasks/ToolsLoaderAsyncTask$ToolLoadResult;
.super Ljava/lang/Object;
.source "ToolsLoaderAsyncTask.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/async_tasks/ToolsLoaderAsyncTask;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ToolLoadResult"
.end annotation


# instance fields
.field public entries:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;",
            ">;"
        }
    .end annotation
.end field

.field public tools:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public whiteLabel:Z


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
