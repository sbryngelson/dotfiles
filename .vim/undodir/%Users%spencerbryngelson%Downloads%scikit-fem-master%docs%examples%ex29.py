Vim�UnDo� ���k�չ�|�{����� a:�9�z�4��~�{�   X   Celement = {'u': getattr(element_line, f'ElementLine{u_element}')(),   '   '                       _��    _�                             ����                                                                                                                                                                                                                                                                                                                                       5           V        _��     �             3   RThe linear stability of one-dimensional solutions of the Navier–Stokes equations   -is governed by the `Orr–Sommerfeld equation   K<https://en.wikipedia.org/wiki/Orr%E2%80%93Sommerfeld_equation>`_ (Drazin &   FReid 2004, p. 156).  This is expressed in terms of the stream-function   K:math:`\phi` of the perturbation, giving a two-point boundary value problem       	.. math::   '   \alpha\phi(\pm 1) = \phi'(\pm 1) = 0   :for a complex fourth-order ordinary differential equation,       	.. math::   ?   \left(\alpha^2-\frac{\mathrm d^2}{\mathrm dz^2}\right)^2\phi      = (\mathrm j\alpha R)\left\{   F     (c - U)\left(\alpha^2-\frac{\mathrm d^2}{\mathrm dz^2}\right)\phi        - U''\phi,      \right\}       Mwhere :math:`U(z)` is the base velocity profile, :math:`c` and :math:`\alpha`   Iare the wavespeed and wavenumber of the disturbance, and :math:`R` is the   DReynolds number.  In the 'temporal' stability problem, :math:`R` and   K:math:`\alpha` are specified as positive and :math:`c` found as the complex   eigenvalue.       OThe fourth-order derivatives would require :math:`C^1` finite elements, e.g. of   Ithe Hermite family (Mamou & Khalid 2004); however, this can be avoided by   Preverting to the system from which the Orr–Sommerfeld stream-function equation   Nis derived (Drazin & Reid 2004, eq. 25.9, p. 155), which is expressed in terms   Iof pressure :math:`p` and longitudinal :math:`u` and transverse :math:`w`   .components of the disturbance to the velocity:       	.. math::         �   \left(\mathrm j\alpha R U(z) + \alpha^2 - \frac{\mathrm d^2}{\mathrm dz^2}\right)u + RU'(z)w + \mathrm j\alpha  Rp &= \mathrm j\alpha Rc u \\   �   \left(\mathrm j\alpha R U(z) + \alpha^2 - \frac{\mathrm d^2}{\mathrm dz^2}\right)w + R\frac{\mathrm dp}{\mathrm dz} &= \mathrm j\alpha Rc w \\   >   \mathrm j\alpha R u + R\;\frac{\mathrm dw}{\mathrm dz} &= 0         BThis primitive system is second-order and can be discretized using   �one-dimensional Taylor–Hood or Mini elements; here the former are the default with the latter selectable with the `--element Mini` command-line option.       OThe classical test-case for this problem is plane Poiseuille flow :math:`U(z) =   I1 - z^2` on :math:`-1 < z < 1` at :math:`\alpha = 1` and :math:`R = 10^4`   N(Drazin & Reid 2004, figure 4.19; Mamou & Khalid 2004), typically seeking only   Hthe 'even' modes for which :math:`u(0) = u(1) = w'(0) = w(1) = 0`.  Good   Oagreement with reference results for the complex wavespeed spectrum (Criminale,   FJackson, & Joslin 2003, table 3.1) is obtained on a uniform mesh of 64   	segments.       �* Criminale, W. O., Jackson, T. L.,, Joslin, R. D. (2003). *Theory and Computation in Hydrodynamic Stability.* Cambridge: Cambridge University Press. `doi:10.1017/CBO9780511550317 <https://doi.org/10.1017%2fCBO9780511550317>`_   �* Drazin, P. G., Reid, W. H. (2004). *Hydrodynamic Stability.* Cambridge University Press. `doi:10.1017/CBO9780511616938 <https://doi.org/10.1017%2fCBO9780511616938>`_  * Mamou, M. & Khalid, M. (2004). Finite element solution of the Orr–Sommerfeld equation using high precision Hermite elements: plane Poiseuille flow. *International Journal for Numerical Methods in Fluids* 44. pp. 721–735. `doi:10.1002/fld.661 <https://doi.org/10.1002%2ffld.661>`_    5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        _��     �                """5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        _��     �                 !"""Linear hydrodynamic stability.5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        _��     �                  5�_�                    R        ����                                                                                                                                                                                                                                                                                                                                                  V        _��    �   Q   R          H    fig.suptitle('even modes of plane Poiseuille flow (Re=10⁴, α=1)')5�_�                     '   '    ����                                                                                                                                                                                                                                                                                                                                                             _��    �   &   (   X      Celement = {'u': getattr(element_line, f'ElementLine{u_element}')(),5��