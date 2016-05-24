.class public final Lcom/google/android/gms/ads/internal/zzq;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;
.implements Landroid/view/ViewTreeObserver$OnScrollChangedListener;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzgk;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/ads/internal/zzq$zza;
    }
.end annotation


# instance fields
.field public final context:Landroid/content/Context;

.field final zzpY:Ljava/lang/String;

.field public zzpZ:Ljava/lang/String;

.field zzpk:Z

.field zzqA:Z

.field private zzqB:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet",
            "<",
            "Lcom/google/android/gms/internal/zzhk;",
            ">;"
        }
    .end annotation
.end field

.field private zzqC:I

.field private zzqD:I

.field private zzqE:Lcom/google/android/gms/internal/zzib;

.field final zzqa:Lcom/google/android/gms/internal/zzan;

.field public final zzqb:Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

.field zzqc:Lcom/google/android/gms/ads/internal/zzq$zza;

.field public zzqd:Lcom/google/android/gms/internal/zzhq;

.field public zzqe:Lcom/google/android/gms/internal/zzhq;

.field public zzqf:Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

.field public zzqg:Lcom/google/android/gms/internal/zzhj;

.field public zzqh:Lcom/google/android/gms/internal/zzhj$zza;

.field public zzqi:Lcom/google/android/gms/internal/zzhk;

.field zzqj:Lcom/google/android/gms/ads/internal/client/zzm;

.field zzqk:Lcom/google/android/gms/ads/internal/client/zzn;

.field zzql:Lcom/google/android/gms/ads/internal/client/zzt;

.field zzqm:Lcom/google/android/gms/ads/internal/client/zzu;

.field zzqn:Lcom/google/android/gms/internal/zzfm;

.field zzqo:Lcom/google/android/gms/internal/zzfq;

.field zzqp:Lcom/google/android/gms/internal/zzct;

.field zzqq:Lcom/google/android/gms/internal/zzcu;

.field zzqr:Lcom/google/android/gms/internal/zzlh;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/internal/zzlh",
            "<",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/internal/zzcv;",
            ">;"
        }
    .end annotation
.end field

.field zzqs:Lcom/google/android/gms/internal/zzlh;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/internal/zzlh",
            "<",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/internal/zzcw;",
            ">;"
        }
    .end annotation
.end field

.field zzqt:Lcom/google/android/gms/ads/internal/formats/NativeAdOptionsParcel;

.field zzqu:Lcom/google/android/gms/internal/zzch;

.field zzqv:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field zzqw:Lcom/google/android/gms/ads/internal/purchase/zzk;

.field public zzqx:Lcom/google/android/gms/internal/zzho;

.field zzqy:Landroid/view/View;

.field public zzqz:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/google/android/gms/ads/internal/client/AdSizeParcel;Ljava/lang/String;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;)V
    .registers 11

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/ads/internal/zzq;-><init>(Landroid/content/Context;Lcom/google/android/gms/ads/internal/client/AdSizeParcel;Ljava/lang/String;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;Lcom/google/android/gms/internal/zzan;)V

    return-void
.end method

.method constructor <init>(Landroid/content/Context;Lcom/google/android/gms/ads/internal/client/AdSizeParcel;Ljava/lang/String;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;Lcom/google/android/gms/internal/zzan;)V
    .registers 10

    const/4 v1, -0x1

    const/4 v0, 0x0

    const/4 v2, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object v2, p0, Lcom/google/android/gms/ads/internal/zzq;->zzqx:Lcom/google/android/gms/internal/zzho;

    iput-object v2, p0, Lcom/google/android/gms/ads/internal/zzq;->zzqy:Landroid/view/View;

    iput v0, p0, Lcom/google/android/gms/ads/internal/zzq;->zzqz:I

    iput-boolean v0, p0, Lcom/google/android/gms/ads/internal/zzq;->zzqA:Z

    iput-boolean v0, p0, Lcom/google/android/gms/ads/internal/zzq;->zzpk:Z

    iput-object v2, p0, Lcom/google/android/gms/ads/internal/zzq;->zzqB:Ljava/util/HashSet;

    iput v1, p0, Lcom/google/android/gms/ads/internal/zzq;->zzqC:I

    iput v1, p0, Lcom/google/android/gms/ads/internal/zzq;->zzqD:I

    invoke-static {p1}, Lcom/google/android/gms/internal/zzby;->zzw(Landroid/content/Context;)V

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbA()Lcom/google/android/gms/internal/zzhl;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzhl;->zzgc()Lcom/google/android/gms/internal/zzca;

    move-result-object v0

    if-eqz v0, :cond_3f

    invoke-static {}, Lcom/google/android/gms/internal/zzby;->zzde()Ljava/util/List;

    move-result-object v0

    iget v1, p4, Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;->zzIA:I

    if-eqz v1, :cond_34

    iget v1, p4, Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;->zzIA:I

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_34
    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbA()Lcom/google/android/gms/internal/zzhl;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzhl;->zzgc()Lcom/google/android/gms/internal/zzca;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/google/android/gms/internal/zzca;->zzb(Ljava/util/List;)V

    :cond_3f
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/ads/internal/zzq;->zzpY:Ljava/lang/String;

    iget-boolean v0, p2, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->zzsH:Z

    if-nez v0, :cond_51

    iget-boolean v0, p2, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->zzsJ:Z

    if-eqz v0, :cond_70

    :cond_51
    iput-object v2, p0, Lcom/google/android/gms/ads/internal/zzq;->zzqc:Lcom/google/android/gms/ads/internal/zzq$zza;

    :goto_53
    iput-object p2, p0, Lcom/google/android/gms/ads/internal/zzq;->zzqf:Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    iput-object p3, p0, Lcom/google/android/gms/ads/internal/zzq;->zzpZ:Ljava/lang/String;

    iput-object p1, p0, Lcom/google/android/gms/ads/internal/zzq;->context:Landroid/content/Context;

    iput-object p4, p0, Lcom/google/android/gms/ads/internal/zzq;->zzqb:Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

    if-eqz p5, :cond_8c

    :goto_5d
    iput-object p5, p0, Lcom/google/android/gms/ads/internal/zzq;->zzqa:Lcom/google/android/gms/internal/zzan;

    new-instance v0, Lcom/google/android/gms/internal/zzib;

    const-wide/16 v2, 0xc8

    invoke-direct {v0, v2, v3}, Lcom/google/android/gms/internal/zzib;-><init>(J)V

    iput-object v0, p0, Lcom/google/android/gms/ads/internal/zzq;->zzqE:Lcom/google/android/gms/internal/zzib;

    new-instance v0, Lcom/google/android/gms/internal/zzlh;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzlh;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/ads/internal/zzq;->zzqs:Lcom/google/android/gms/internal/zzlh;

    return-void

    :cond_70
    new-instance v0, Lcom/google/android/gms/ads/internal/zzq$zza;

    invoke-direct {v0, p1, p0, p0}, Lcom/google/android/gms/ads/internal/zzq$zza;-><init>(Landroid/content/Context;Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;Landroid/view/ViewTreeObserver$OnScrollChangedListener;)V

    iput-object v0, p0, Lcom/google/android/gms/ads/internal/zzq;->zzqc:Lcom/google/android/gms/ads/internal/zzq$zza;

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzq;->zzqc:Lcom/google/android/gms/ads/internal/zzq$zza;

    iget v1, p2, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->widthPixels:I

    invoke-virtual {v0, v1}, Lcom/google/android/gms/ads/internal/zzq$zza;->setMinimumWidth(I)V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzq;->zzqc:Lcom/google/android/gms/ads/internal/zzq$zza;

    iget v1, p2, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->heightPixels:I

    invoke-virtual {v0, v1}, Lcom/google/android/gms/ads/internal/zzq$zza;->setMinimumHeight(I)V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzq;->zzqc:Lcom/google/android/gms/ads/internal/zzq$zza;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Lcom/google/android/gms/ads/internal/zzq$zza;->setVisibility(I)V

    goto :goto_53

    :cond_8c
    new-instance p5, Lcom/google/android/gms/internal/zzan;

    new-instance v0, Lcom/google/android/gms/ads/internal/zzh;

    invoke-direct {v0, p0}, Lcom/google/android/gms/ads/internal/zzh;-><init>(Lcom/google/android/gms/ads/internal/zzq;)V

    invoke-direct {p5, v0}, Lcom/google/android/gms/internal/zzan;-><init>(Lcom/google/android/gms/internal/zzaj;)V

    goto :goto_5d
.end method

.method private zze(Z)V
    .registers 8

    const/4 v0, 0x1

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/zzq;->zzqc:Lcom/google/android/gms/ads/internal/zzq$zza;

    if-eqz v2, :cond_10

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    if-eqz v2, :cond_10

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    iget-object v2, v2, Lcom/google/android/gms/internal/zzhj;->zzAR:Lcom/google/android/gms/internal/zzip;

    if-nez v2, :cond_11

    :cond_10
    :goto_10
    return-void

    :cond_11
    iget-object v2, p0, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    iget-object v2, v2, Lcom/google/android/gms/internal/zzhj;->zzAR:Lcom/google/android/gms/internal/zzip;

    invoke-interface {v2}, Lcom/google/android/gms/internal/zzip;->zzgS()Lcom/google/android/gms/internal/zziq;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zziq;->zzbY()Z

    move-result v2

    if-eqz v2, :cond_10

    if-eqz p1, :cond_29

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/zzq;->zzqE:Lcom/google/android/gms/internal/zzib;

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzib;->tryAcquire()Z

    move-result v2

    if-eqz v2, :cond_10

    :cond_29
    const/4 v2, 0x2

    new-array v2, v2, [I

    iget-object v3, p0, Lcom/google/android/gms/ads/internal/zzq;->zzqc:Lcom/google/android/gms/ads/internal/zzq$zza;

    invoke-virtual {v3, v2}, Lcom/google/android/gms/ads/internal/zzq$zza;->getLocationOnScreen([I)V

    invoke-static {}, Lcom/google/android/gms/ads/internal/client/zzk;->zzcE()Lcom/google/android/gms/ads/internal/util/client/zza;

    move-result-object v3

    iget-object v4, p0, Lcom/google/android/gms/ads/internal/zzq;->context:Landroid/content/Context;

    aget v5, v2, v1

    invoke-virtual {v3, v4, v5}, Lcom/google/android/gms/ads/internal/util/client/zza;->zzc(Landroid/content/Context;I)I

    move-result v3

    invoke-static {}, Lcom/google/android/gms/ads/internal/client/zzk;->zzcE()Lcom/google/android/gms/ads/internal/util/client/zza;

    move-result-object v4

    iget-object v5, p0, Lcom/google/android/gms/ads/internal/zzq;->context:Landroid/content/Context;

    aget v2, v2, v0

    invoke-virtual {v4, v5, v2}, Lcom/google/android/gms/ads/internal/util/client/zza;->zzc(Landroid/content/Context;I)I

    move-result v2

    iget v4, p0, Lcom/google/android/gms/ads/internal/zzq;->zzqC:I

    if-ne v3, v4, :cond_51

    iget v4, p0, Lcom/google/android/gms/ads/internal/zzq;->zzqD:I

    if-eq v2, v4, :cond_10

    :cond_51
    iput v3, p0, Lcom/google/android/gms/ads/internal/zzq;->zzqC:I

    iput v2, p0, Lcom/google/android/gms/ads/internal/zzq;->zzqD:I

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    iget-object v2, v2, Lcom/google/android/gms/internal/zzhj;->zzAR:Lcom/google/android/gms/internal/zzip;

    invoke-interface {v2}, Lcom/google/android/gms/internal/zzip;->zzgS()Lcom/google/android/gms/internal/zziq;

    move-result-object v2

    iget v3, p0, Lcom/google/android/gms/ads/internal/zzq;->zzqC:I

    iget v4, p0, Lcom/google/android/gms/ads/internal/zzq;->zzqD:I

    if-nez p1, :cond_67

    :goto_63
    invoke-virtual {v2, v3, v4, v0}, Lcom/google/android/gms/internal/zziq;->zza(IIZ)V

    goto :goto_10

    :cond_67
    move v0, v1

    goto :goto_63
.end method


# virtual methods
.method public destroy()V
    .registers 3

    const/4 v1, 0x0

    invoke-virtual {p0}, Lcom/google/android/gms/ads/internal/zzq;->zzbR()V

    iput-object v1, p0, Lcom/google/android/gms/ads/internal/zzq;->zzqk:Lcom/google/android/gms/ads/internal/client/zzn;

    iput-object v1, p0, Lcom/google/android/gms/ads/internal/zzq;->zzql:Lcom/google/android/gms/ads/internal/client/zzt;

    iput-object v1, p0, Lcom/google/android/gms/ads/internal/zzq;->zzqo:Lcom/google/android/gms/internal/zzfq;

    iput-object v1, p0, Lcom/google/android/gms/ads/internal/zzq;->zzqn:Lcom/google/android/gms/internal/zzfm;

    iput-object v1, p0, Lcom/google/android/gms/ads/internal/zzq;->zzqu:Lcom/google/android/gms/internal/zzch;

    iput-object v1, p0, Lcom/google/android/gms/ads/internal/zzq;->zzqm:Lcom/google/android/gms/ads/internal/client/zzu;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/google/android/gms/ads/internal/zzq;->zzf(Z)V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzq;->zzqc:Lcom/google/android/gms/ads/internal/zzq$zza;

    if-eqz v0, :cond_1d

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzq;->zzqc:Lcom/google/android/gms/ads/internal/zzq$zza;

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/zzq$zza;->removeAllViews()V

    :cond_1d
    invoke-virtual {p0}, Lcom/google/android/gms/ads/internal/zzq;->zzbM()V

    invoke-virtual {p0}, Lcom/google/android/gms/ads/internal/zzq;->zzbO()V

    iput-object v1, p0, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    return-void
.end method

.method public onGlobalLayout()V
    .registers 2

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/google/android/gms/ads/internal/zzq;->zze(Z)V

    return-void
.end method

.method public onScrollChanged()V
    .registers 2

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/google/android/gms/ads/internal/zzq;->zze(Z)V

    return-void
.end method

.method public zza(Ljava/util/HashSet;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashSet",
            "<",
            "Lcom/google/android/gms/internal/zzhk;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/google/android/gms/ads/internal/zzq;->zzqB:Ljava/util/HashSet;

    return-void
.end method

.method public zzbL()Ljava/util/HashSet;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashSet",
            "<",
            "Lcom/google/android/gms/internal/zzhk;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzq;->zzqB:Ljava/util/HashSet;

    return-object v0
.end method

.method public zzbM()V
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    if-eqz v0, :cond_11

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzhj;->zzAR:Lcom/google/android/gms/internal/zzip;

    if-eqz v0, :cond_11

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzhj;->zzAR:Lcom/google/android/gms/internal/zzip;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzip;->destroy()V

    :cond_11
    return-void
.end method

.method public zzbN()V
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    if-eqz v0, :cond_11

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzhj;->zzAR:Lcom/google/android/gms/internal/zzip;

    if-eqz v0, :cond_11

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzhj;->zzAR:Lcom/google/android/gms/internal/zzip;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzip;->stopLoading()V

    :cond_11
    return-void
.end method

.method public zzbO()V
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    if-eqz v0, :cond_11

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzhj;->zzyR:Lcom/google/android/gms/internal/zzei;

    if-eqz v0, :cond_11

    :try_start_a
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzhj;->zzyR:Lcom/google/android/gms/internal/zzei;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzei;->destroy()V
    :try_end_11
    .catch Landroid/os/RemoteException; {:try_start_a .. :try_end_11} :catch_12

    :cond_11
    :goto_11
    return-void

    :catch_12
    move-exception v0

    const-string v0, "Could not destroy mediation adapter."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    goto :goto_11
.end method

.method public zzbP()Z
    .registers 2

    iget v0, p0, Lcom/google/android/gms/ads/internal/zzq;->zzqz:I

    if-nez v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public zzbQ()Z
    .registers 3

    const/4 v0, 0x1

    iget v1, p0, Lcom/google/android/gms/ads/internal/zzq;->zzqz:I

    if-ne v1, v0, :cond_6

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public zzbR()V
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzq;->zzqc:Lcom/google/android/gms/ads/internal/zzq$zza;

    if-eqz v0, :cond_9

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzq;->zzqc:Lcom/google/android/gms/ads/internal/zzq$zza;

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/zzq$zza;->zzbR()V

    :cond_9
    return-void
.end method

.method public zzbS()V
    .registers 5

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzq;->zzqi:Lcom/google/android/gms/internal/zzhk;

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    iget-wide v2, v1, Lcom/google/android/gms/internal/zzhj;->zzGI:J

    invoke-virtual {v0, v2, v3}, Lcom/google/android/gms/internal/zzhk;->zzl(J)V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzq;->zzqi:Lcom/google/android/gms/internal/zzhk;

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    iget-wide v2, v1, Lcom/google/android/gms/internal/zzhj;->zzGJ:J

    invoke-virtual {v0, v2, v3}, Lcom/google/android/gms/internal/zzhk;->zzm(J)V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzq;->zzqi:Lcom/google/android/gms/internal/zzhk;

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/zzq;->zzqf:Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    iget-boolean v1, v1, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->zzsH:Z

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzhk;->zzy(Z)V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzq;->zzqi:Lcom/google/android/gms/internal/zzhk;

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    iget-boolean v1, v1, Lcom/google/android/gms/internal/zzhj;->zzDX:Z

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzhk;->zzz(Z)V

    return-void
.end method

.method public zzf(Z)V
    .registers 3

    iget v0, p0, Lcom/google/android/gms/ads/internal/zzq;->zzqz:I

    if-nez v0, :cond_7

    invoke-virtual {p0}, Lcom/google/android/gms/ads/internal/zzq;->zzbN()V

    :cond_7
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzq;->zzqd:Lcom/google/android/gms/internal/zzhq;

    if-eqz v0, :cond_10

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzq;->zzqd:Lcom/google/android/gms/internal/zzhq;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzhq;->cancel()V

    :cond_10
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzq;->zzqe:Lcom/google/android/gms/internal/zzhq;

    if-eqz v0, :cond_19

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzq;->zzqe:Lcom/google/android/gms/internal/zzhq;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzhq;->cancel()V

    :cond_19
    if-eqz p1, :cond_1e

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    :cond_1e
    return-void
.end method
