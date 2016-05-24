.class final Lcom/google/android/gms/internal/zzgm$4;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zziq$zza;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzgm;->zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzcd;Lcom/google/android/gms/internal/zzcc;)Lcom/google/android/gms/internal/zziq$zza;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic zzER:Ljava/lang/String;

.field final synthetic zzES:Lcom/google/android/gms/internal/zzcc;

.field final synthetic zzoC:Lcom/google/android/gms/internal/zzcd;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzcd;Lcom/google/android/gms/internal/zzcc;Ljava/lang/String;)V
    .registers 4

    iput-object p1, p0, Lcom/google/android/gms/internal/zzgm$4;->zzoC:Lcom/google/android/gms/internal/zzcd;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzgm$4;->zzES:Lcom/google/android/gms/internal/zzcc;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzgm$4;->zzER:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public zza(Lcom/google/android/gms/internal/zzip;Z)V
    .registers 8

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgm$4;->zzoC:Lcom/google/android/gms/internal/zzcd;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgm$4;->zzES:Lcom/google/android/gms/internal/zzcc;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "jsf"

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/zzcd;->zza(Lcom/google/android/gms/internal/zzcc;[Ljava/lang/String;)Z

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgm$4;->zzoC:Lcom/google/android/gms/internal/zzcd;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzcd;->zzdm()V

    const-string v0, "AFMA_buildAdURL"

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgm$4;->zzER:Ljava/lang/String;

    invoke-interface {p1, v0, v1}, Lcom/google/android/gms/internal/zzip;->zza(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
