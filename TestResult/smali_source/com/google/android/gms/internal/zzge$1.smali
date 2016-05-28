.class Lcom/google/android/gms/internal/zzge$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzge;->zzdG()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzCR:Lcom/google/android/gms/internal/zzge;

.field final synthetic zzpx:Lcom/google/android/gms/internal/zzhj;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzge;Lcom/google/android/gms/internal/zzhj;)V
    .registers 3

    iput-object p1, p0, Lcom/google/android/gms/internal/zzge$1;->zzCR:Lcom/google/android/gms/internal/zzge;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzge$1;->zzpx:Lcom/google/android/gms/internal/zzhj;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    iget-object v0, p0, Lcom/google/android/gms/internal/zzge$1;->zzCR:Lcom/google/android/gms/internal/zzge;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzge;->zza(Lcom/google/android/gms/internal/zzge;)Lcom/google/android/gms/internal/zzga$zza;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzge$1;->zzpx:Lcom/google/android/gms/internal/zzhj;

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/zzga$zza;->zzb(Lcom/google/android/gms/internal/zzhj;)V

    return-void
.end method
