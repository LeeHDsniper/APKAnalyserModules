.class Lcom/google/android/gms/internal/zzof$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzof;->zze(Lcom/google/android/gms/internal/zzob;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzaIi:Lcom/google/android/gms/internal/zzob;

.field final synthetic zzaIj:Lcom/google/android/gms/internal/zzof;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzof;Lcom/google/android/gms/internal/zzob;)V
    .registers 3

    iput-object p1, p0, Lcom/google/android/gms/internal/zzof$1;->zzaIj:Lcom/google/android/gms/internal/zzof;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzof$1;->zzaIi:Lcom/google/android/gms/internal/zzob;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    iget-object v0, p0, Lcom/google/android/gms/internal/zzof$1;->zzaIi:Lcom/google/android/gms/internal/zzob;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzob;->zzxo()Lcom/google/android/gms/internal/zzoe;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzof$1;->zzaIi:Lcom/google/android/gms/internal/zzob;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzoe;->zza(Lcom/google/android/gms/internal/zzob;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzof$1;->zzaIj:Lcom/google/android/gms/internal/zzof;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzof;->zza(Lcom/google/android/gms/internal/zzof;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_15
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_27

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzog;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzof$1;->zzaIi:Lcom/google/android/gms/internal/zzob;

    invoke-interface {v0, v2}, Lcom/google/android/gms/internal/zzog;->zza(Lcom/google/android/gms/internal/zzob;)V

    goto :goto_15

    :cond_27
    iget-object v0, p0, Lcom/google/android/gms/internal/zzof$1;->zzaIj:Lcom/google/android/gms/internal/zzof;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzof$1;->zzaIi:Lcom/google/android/gms/internal/zzob;

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/zzof;->zza(Lcom/google/android/gms/internal/zzof;Lcom/google/android/gms/internal/zzob;)V

    return-void
.end method
