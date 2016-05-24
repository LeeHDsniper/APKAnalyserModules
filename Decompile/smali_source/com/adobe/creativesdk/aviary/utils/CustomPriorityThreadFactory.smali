.class public final Lcom/adobe/creativesdk/aviary/utils/CustomPriorityThreadFactory;
.super Ljava/lang/Object;
.source "CustomPriorityThreadFactory.java"

# interfaces
.implements Ljava/util/concurrent/ThreadFactory;


# instance fields
.field private final threadPriority:I


# direct methods
.method public constructor <init>(I)V
    .registers 2
    .param p1, "threadPriority"    # I

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    iput p1, p0, Lcom/adobe/creativesdk/aviary/utils/CustomPriorityThreadFactory;->threadPriority:I

    .line 16
    return-void
.end method


# virtual methods
.method public newThread(Ljava/lang/Runnable;)Ljava/lang/Thread;
    .registers 4
    .param p1, "r"    # Ljava/lang/Runnable;

    .prologue
    .line 20
    new-instance v0, Ljava/lang/Thread;

    invoke-direct {v0, p1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 21
    .local v0, "thread":Ljava/lang/Thread;
    iget v1, p0, Lcom/adobe/creativesdk/aviary/utils/CustomPriorityThreadFactory;->threadPriority:I

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setPriority(I)V

    .line 22
    return-object v0
.end method
