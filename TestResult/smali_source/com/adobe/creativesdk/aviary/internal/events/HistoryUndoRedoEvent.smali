.class public Lcom/adobe/creativesdk/aviary/internal/events/HistoryUndoRedoEvent;
.super Ljava/lang/Object;
.source "HistoryUndoRedoEvent.java"


# instance fields
.field public final isUndo:Z


# direct methods
.method public constructor <init>(Z)V
    .registers 2
    .param p1, "isUndo"    # Z

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    iput-boolean p1, p0, Lcom/adobe/creativesdk/aviary/internal/events/HistoryUndoRedoEvent;->isUndo:Z

    .line 12
    return-void
.end method
