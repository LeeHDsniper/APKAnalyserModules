.class Lcom/google/android/gms/internal/zzgm$5;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzdv$zzb;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzgm;-><init>(Landroid/content/Context;Lcom/google/android/gms/internal/zzbr;Lcom/google/android/gms/internal/zzgl;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/android/gms/internal/zzdv$zzb",
        "<",
        "Lcom/google/android/gms/internal/zzbb;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic zzEW:Lcom/google/android/gms/internal/zzgm;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzgm;)V
    .registers 2

    iput-object p1, p0, Lcom/google/android/gms/internal/zzgm$5;->zzEW:Lcom/google/android/gms/internal/zzgm;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public zza(Lcom/google/android/gms/internal/zzbb;)V
    .registers 4

    const-string v0, "/log"

    sget-object v1, Lcom/google/android/gms/internal/zzdf;->zzwP:Lcom/google/android/gms/internal/zzdg;

    invoke-interface {p1, v0, v1}, Lcom/google/android/gms/internal/zzbb;->zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzdg;)V

    return-void
.end method

.method public synthetic zzc(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lcom/google/android/gms/internal/zzbb;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzgm$5;->zza(Lcom/google/android/gms/internal/zzbb;)V

    return-void
.end method
