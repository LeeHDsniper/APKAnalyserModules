.class Lcom/google/android/gms/internal/zzdh$zzb;
.super Ljava/lang/Object;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzgk;
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zzdh;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "zzb"
.end annotation


# instance fields
.field private final zzwY:Ljava/lang/String;

.field private final zzwZ:Ljava/net/URL;

.field private final zzxa:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/google/android/gms/internal/zzdh$zza;",
            ">;"
        }
    .end annotation
.end field

.field private final zzxb:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/net/URL;Ljava/util/ArrayList;Ljava/lang/String;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/net/URL;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/google/android/gms/internal/zzdh$zza;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzdh$zzb;->zzwY:Ljava/lang/String;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzdh$zzb;->zzwZ:Ljava/net/URL;

    if-nez p3, :cond_13

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzdh$zzb;->zzxa:Ljava/util/ArrayList;

    :goto_10
    iput-object p4, p0, Lcom/google/android/gms/internal/zzdh$zzb;->zzxb:Ljava/lang/String;

    return-void

    :cond_13
    iput-object p3, p0, Lcom/google/android/gms/internal/zzdh$zzb;->zzxa:Ljava/util/ArrayList;

    goto :goto_10
.end method


# virtual methods
.method public zzdA()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzdh$zzb;->zzwY:Ljava/lang/String;

    return-object v0
.end method

.method public zzdB()Ljava/net/URL;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzdh$zzb;->zzwZ:Ljava/net/URL;

    return-object v0
.end method

.method public zzdC()Ljava/util/ArrayList;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/google/android/gms/internal/zzdh$zza;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzdh$zzb;->zzxa:Ljava/util/ArrayList;

    return-object v0
.end method

.method public zzdD()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzdh$zzb;->zzxb:Ljava/lang/String;

    return-object v0
.end method
