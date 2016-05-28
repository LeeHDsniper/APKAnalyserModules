.class public abstract Lcom/google/android/gms/common/api/zzk;
.super Ljava/lang/Object;


# static fields
.field private static final zzaay:Ljava/util/concurrent/ExecutorService;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const/4 v0, 0x2

    invoke-static {v0}, Ljava/util/concurrent/Executors;->newFixedThreadPool(I)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/common/api/zzk;->zzaay:Ljava/util/concurrent/ExecutorService;

    return-void
.end method

.method public static zznF()Ljava/util/concurrent/ExecutorService;
    .registers 1

    sget-object v0, Lcom/google/android/gms/common/api/zzk;->zzaay:Ljava/util/concurrent/ExecutorService;

    return-object v0
.end method
