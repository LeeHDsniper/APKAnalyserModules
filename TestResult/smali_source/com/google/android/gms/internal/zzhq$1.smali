.class Lcom/google/android/gms/internal/zzhq$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zzhq;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzHu:Lcom/google/android/gms/internal/zzhq;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzhq;)V
    .registers 2

    iput-object p1, p0, Lcom/google/android/gms/internal/zzhq$1;->zzHu:Lcom/google/android/gms/internal/zzhq;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 3

    iget-object v0, p0, Lcom/google/android/gms/internal/zzhq$1;->zzHu:Lcom/google/android/gms/internal/zzhq;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/zzhq;->zza(Lcom/google/android/gms/internal/zzhq;Ljava/lang/Thread;)Ljava/lang/Thread;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzhq$1;->zzHu:Lcom/google/android/gms/internal/zzhq;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzhq;->zzdG()V

    return-void
.end method
