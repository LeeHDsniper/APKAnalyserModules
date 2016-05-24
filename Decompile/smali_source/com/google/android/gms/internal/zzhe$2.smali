.class Lcom/google/android/gms/internal/zzhe$2;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzhe;->zzdG()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzGC:Lcom/google/android/gms/internal/zzhe;

.field final synthetic zzpx:Lcom/google/android/gms/internal/zzhj;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzhe;Lcom/google/android/gms/internal/zzhj;)V
    .registers 3

    iput-object p1, p0, Lcom/google/android/gms/internal/zzhe$2;->zzGC:Lcom/google/android/gms/internal/zzhe;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzhe$2;->zzpx:Lcom/google/android/gms/internal/zzhj;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    iget-object v0, p0, Lcom/google/android/gms/internal/zzhe$2;->zzGC:Lcom/google/android/gms/internal/zzhe;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzhe;->zza(Lcom/google/android/gms/internal/zzhe;)Lcom/google/android/gms/internal/zzgx;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzhe$2;->zzpx:Lcom/google/android/gms/internal/zzhj;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzgx;->zzb(Lcom/google/android/gms/internal/zzhj;)V

    return-void
.end method
